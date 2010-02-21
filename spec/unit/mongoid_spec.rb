require "spec_helper"

describe Humanoid do

  describe ".configure" do

    context "when no block supplied" do

      it "returns the config singleton" do
        Humanoid.configure.should == Humanoid::Config.instance
      end

    end

    context "when a block is supplied" do

      before do
        Humanoid.configure do |config|
          config.allow_dynamic_fields = false
        end
      end

      after do
        Humanoid.configure do |config|
          config.allow_dynamic_fields = true
        end
      end

      it "sets the values on the config instance" do
        Humanoid.allow_dynamic_fields.should be_false
      end

    end

  end

end
