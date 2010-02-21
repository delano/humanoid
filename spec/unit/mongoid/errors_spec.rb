require "spec_helper"

describe Humanoid::Errors do

  describe Humanoid::Errors::DocumentNotFound do

    describe "#message" do

      context "default" do

        before do
          @error = Humanoid::Errors::DocumentNotFound.new(Person, "3")
        end

        it "contains document not found" do
          @error.message.should include("Document not found")
        end

      end

    end

  end

  describe Humanoid::Errors::InvalidOptions do

    describe "#message" do

      context "default" do

        before do
          @error = Humanoid::Errors::InvalidOptions.new
        end

        it "returns the class name" do
          @error.message.should == @error.class.name
        end

      end

    end

  end

  describe Humanoid::Errors::InvalidDatabase do

    describe "#message" do

      before do
        @error = Humanoid::Errors::InvalidDatabase.new("Test")
      end

      it "returns a message with the bad db object class" do
        @error.message.should include("String")
      end

    end

  end

  describe Humanoid::Errors::Validations do

    describe "#message" do

      context "default" do

        before do
          @errors = stub(:full_messages => "Testing")
          @error = Humanoid::Errors::Validations.new(@errors)
        end

        it "contains the errors' full messages" do
          @error.message.should include("Testing")
        end

      end

    end

  end

  describe Humanoid::Errors::InvalidCollection do

    describe "#message" do

      context "default" do

        before do
          @klass = Address
          @error = Humanoid::Errors::InvalidCollection.new(@klass)
        end

        it "contains class is not allowed" do
          @error.message.should include("Address is not allowed")
        end

      end

    end

  end

end
