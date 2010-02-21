require "spec_helper"

describe Humanoid::Commands do

  before do
    @person = Person.new(:_id => Mongo::ObjectID.new.to_s)
  end

  describe "#delete" do

    it "delegates to the Delete command" do
      Humanoid::Commands::Delete.expects(:execute).with(@person)
      @person.delete
    end

  end

  describe "#destroy" do

    it "delegates to the Destroy command" do
      Humanoid::Commands::Destroy.expects(:execute).with(@person)
      @person.destroy
    end

  end

  describe "#save" do

    it "delegates to the Save command" do
      Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
      @person.save
    end

    context "when document is new" do

      before do
        @person = Person.new
      end

      context "when validation fails" do

        it "it raises an error" do
          Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(false)
          @person.save.should be_false
        end

        it "should run callback before_create and no after_create" do
          @person.expects(:run_callbacks).with(:before_create)
          Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(false)
          @person.expects(:run_callbacks).with(:after_create).never
          @person.save.should be_false
        end

      end

      it "delegates to the save command" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.save
      end

      it "runs the before and after create callbacks" do
        @person.expects(:run_callbacks).with(:before_create)
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.expects(:run_callbacks).with(:after_create)
        @person.save
      end

    end

    context "when not validating" do

      before do
        @person = Person.new
      end

      it "passes the validate param to the command" do
        Humanoid::Commands::Save.expects(:execute).with(@person, false).returns(true)
        @person.save(false)
      end

    end

    context "when the database raises an error" do

      before do
        @person = Person.new
      end

      it "returns false" do
        Humanoid::Commands::Save.expects(:execute).raises(Mongo::OperationFailure.new("Operation Failed"))
        @person.save
        @person.errors.on(:humanoid).should == "Operation Failed"
      end

    end

  end

  describe "#save!" do

    context "when validation passes" do

      it "it returns the person" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.save!
      end

    end

    context "when validation fails" do

      it "it raises an error" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(false)
        lambda { @person.save! }.should raise_error
      end

    end

    context "when document is new" do

      before do
        @person = Person.new
      end

      it "delegates to the save command" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.save!
      end

      context "when validation fails" do

        it "it raises an error " do
          Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(false)
          lambda { @person.save! }.should raise_error
        end

      end

      it "runs the before and after create callbacks" do
        @person.expects(:run_callbacks).with(:before_create)
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.expects(:run_callbacks).with(:after_create)
        @person.save!
      end

    end

  end

  describe "#update_attributes" do

    it "delegates to the Save command" do
      Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
      @person.update_attributes({})
    end

    it "executes the before and after update callbacks" do
      @person.expects(:run_callbacks).with(:before_update)
      Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
      @person.expects(:run_callbacks).with(:after_update)
      @person.update_attributes({})
    end

  end

  describe "#update_attributes!" do

    context "when validation passes" do

      it "it returns the person" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(true)
        @person.update_attributes({}).should be_true
      end

    end

    context "when validation fails" do

      it "it raises an error" do
        Humanoid::Commands::Save.expects(:execute).with(@person, true).returns(false)
        lambda { @person.update_attributes!({}) }.should raise_error
      end

    end

  end

  describe ".create" do

    it "delegates to the Create command" do
      Humanoid::Commands::Create.expects(:execute)
      Person.create
    end

    it "returns the document" do
      Humanoid::Commands::Create.expects(:execute).returns(Person.new)
      Person.create.should_not be_nil
    end

    context "when the database raises an error" do

      before do
        @person = Person.new
        Humanoid::Commands::Save.expects(:execute).raises(Mongo::OperationFailure.new("Operation Failed"))
      end

      it "returns the document with errors" do
        person = Person.create
        person.errors.on(:humanoid).should == "Operation Failed"
      end

      it "keeps the document's new record flag" do
        person = Person.create
        person.should be_a_new_record
      end

    end

  end

  describe ".create!" do

    it "delegates to the Create command" do
      Humanoid::Commands::Create.expects(:execute).returns(Person.new)
      Person.create!
    end

    it "returns the document" do
      Humanoid::Commands::Create.expects(:execute).returns(Person.new)
      Person.create!.should_not be_nil
    end

    context "when validation fails" do

      it "raises an error" do
        person = stub(:errors => stub(:empty? => false))
        Humanoid::Commands::Create.expects(:execute).returns(person)
        lambda { Person.create! }.should raise_error(Humanoid::Errors::Validations)
      end

    end

  end

  describe ".delete_all" do

    it "delegates to the DeleteAll command" do
      Humanoid::Commands::DeleteAll.expects(:execute).with(Person, {})
      Person.delete_all
    end

  end

  describe ".destroy_all" do

    it "delegates to the DestroyAll command" do
      Humanoid::Commands::DestroyAll.expects(:execute).with(Person, {})
      Person.destroy_all
    end

  end

  describe "#valid?" do

    before do
      @comment = Comment.new
    end

    it "validates the document" do
      @comment.valid?.should be_false
    end

    it "runs the validation callbacks" do
      @comment.expects(:run_callbacks).with(:validate)
      @comment.expects(:run_callbacks).with(:before_validation)
      @comment.expects(:run_callbacks).with(:after_validation)
      @comment.valid?
    end

  end

end
