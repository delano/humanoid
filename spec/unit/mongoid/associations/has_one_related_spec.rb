require "spec_helper"

describe Humanoid::Associations::HasOneRelated do

  let(:document) { stub(:id => "1") }
  let(:block) do
    Proc.new do
      def extension
        "Testing"
      end
    end
  end
  let(:options) do
    Humanoid::Associations::Options.new(:name => :game, :extend => block)
  end

  describe "#build" do

    before do
      @parent = stub(:id => "5", :class => Person)
      Game.expects(:first).returns(nil)
      @association = Humanoid::Associations::HasOneRelated.new(@parent, options)
    end

    it "adds a new object to the association" do
      @association.build(:score => 100)
      @association.score.should == 100
    end

    it "sets the parent object id on the child" do
      @association.build(:score => 100)
      @association.person_id.should == @parent.id
    end

    it "sets the parent object reference on the child" do
      @association.build(:score => 100)
      @association.person.should == @parent
    end

  end

  describe "#create" do

    before do
      @parent = stub(:id => "5", :class => Person)
      Game.expects(:first).returns(nil)
      Humanoid::Commands::Save.expects(:execute)
      @association = Humanoid::Associations::HasOneRelated.new(@parent, options)
    end

    it "adds a new object to the association" do
      @association.create(:score => 100)
      @association.score.should == 100
    end

    it "sets the parent object id on the child" do
      @association.create(:score => 100)
      @association.person_id.should == @parent.id
    end

    it "returns the new document" do
      @association.create(:score => 100).should be_a_kind_of(Game)
    end

  end

  describe "#id" do

    before do
      @parent = stub(:id => "5", :class => Person)
      @game = Game.new
      Game.expects(:first).returns(@game)
      @association = Humanoid::Associations::HasOneRelated.new(@parent, options)
    end

    it "delegates to the proxied document" do
      @association.id.should == @game.id
    end

  end

  describe ".initialize" do

    before do
      @person = Person.new
      @game = stub
    end

    it "finds the association game by the parent key" do
      Game.expects(:first).with(:conditions => { "person_id"=> @person.id }).returns(@game)
      @person.game.should == @game
    end

    context "when the options have an extension" do

      before do
        @parent = stub(:id => "5", :class => Person)
        @game = Game.new
        Game.expects(:first).returns(@game)
        @association = Humanoid::Associations::HasOneRelated.new(@parent, options)
      end

      it "adds the extension to the module" do
        @association.extension.should == "Testing"
      end

    end

  end

  describe ".instantiate" do

    it "delegates to new" do
      Humanoid::Associations::HasOneRelated.expects(:new).with(document, options, nil)
      Humanoid::Associations::HasOneRelated.instantiate(document, options)
    end

  end

  describe "#method_missing" do

    before do
      @person = Person.new
      @game = stub
    end

    it "delegates to the documet" do
      Game.expects(:first).with(:conditions => { "person_id"=> @person.id }).returns(@game)
      @game.expects(:strange_method)
      association = Humanoid::Associations::HasOneRelated.instantiate(@person, options)
      association.strange_method
    end

  end

  describe ".macro" do

    it "returns :has_one_related" do
      Humanoid::Associations::HasOneRelated.macro.should == :has_one_related
    end

  end

  describe "#nil?" do

    before do
      @person = Person.new
      @game = stub
      Game.expects(:first).with(:conditions => { "person_id"=> @person.id }).returns(nil)
    end

    it "delegates to the document" do
      association = Humanoid::Associations::HasOneRelated.instantiate(@person, options)
      association.should be_nil
    end

  end

  describe ".update" do

    before do
      @person = Person.new
      @game = stub
    end

    it "sets the parent on the child association" do
      @game.expects(:person=).with(@person)
      Humanoid::Associations::HasOneRelated.update(@game, @person, options)
    end

    it "returns the proxy" do
      @game.expects(:person=).with(@person)
      @proxy = Humanoid::Associations::HasOneRelated.update(@game, @person, options)
      @proxy.target.should == @game
    end

  end

end
