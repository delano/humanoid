require "spec_helper"

describe Humanoid::Contexts do

  context ".context_for" do
    let(:klass) { stub('klass', :embedded => false) }
    let(:criteria) { stub('criteria', :klass => klass) }

    context "when criteria is for a top-level Humanoid::Document" do
      it "creates a Mongo context" do
        Humanoid::Contexts::Mongo.expects(:new).with(criteria)
        Humanoid::Contexts.context_for(criteria)
      end
    end

    context "when criteria is for an embedded Humanoid::Document" do
      it "creates a Mongo context" do
        klass.stubs(:embedded).returns(true)
        Humanoid::Contexts::Enumerable.expects(:new).with(criteria)
        Humanoid::Contexts.context_for(criteria)
      end
    end
  end

end
