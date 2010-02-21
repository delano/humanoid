require "spec_helper"

describe Humanoid::Matchers::Size do

  let(:matcher) { Humanoid::Matchers::Size.new(["first", "second"]) }

  describe "#matches?" do

    context "when the attribute is the same size" do

      it "returns true" do
        matcher.matches?("$size" => 2).should be_true
      end

    end

    context "when the attribute is not the same size" do

      it "returns false" do
        matcher.matches?("$size" => 5).should be_false
      end

    end

  end

end
