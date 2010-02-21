require "spec_helper"

describe Humanoid::Identity do

  describe ".create" do

    let(:name) { Name.new }

    it "sets the document _type to the class name" do
      Humanoid::Identity.create(name)
      name._type.should == "Name"
    end

    it "returns the document" do
      Humanoid::Identity.create(name).should == name
    end

    context "when the document has a primary key" do

      before do
        @address = Address.allocate
        @address.instance_variable_set(:@attributes, { "street" => "Market St"})
      end

      it "sets the id to the composite key" do
        Humanoid::Identity.create(@address)
        @address.id.should == "market-st"
      end

    end

    context "when the document has no primary key" do

      context "when the document has no id" do

        before do
          @person = Person.allocate
          @person.instance_variable_set(:@attributes, {})
          @object_id = stub(:to_s => "1")
          Mongo::ObjectID.expects(:new).returns(@object_id)
        end

        context "when using object ids" do

          before do
            Humanoid.use_object_ids = true
          end

          after do
            Humanoid.use_object_ids = false
          end

          it "sets the id to a mongo object id" do
            Humanoid::Identity.create(@person)
            @person.id.should == @object_id
          end
        end

        context "when not using object ids" do

          it "sets the id to a mongo object id string" do
            Humanoid::Identity.create(@person)
            @person.id.should == "1"
          end

        end

      end

      context "when the document has an id" do

        before do
          @person = Person.allocate
          @person.instance_variable_set(:@attributes, { "_id" => "5" })
        end

        it "returns the existing id" do
          Humanoid::Identity.create(@person)
          @person.id.should == "5"
        end

      end

    end

  end

end
