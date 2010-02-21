require "spec_helper"

describe Humanoid::Matchers::Ne do

  let(:matcher) { Humanoid::Matchers::Ne.new("first") }

  describe "#matches?" do

    context "when the values are not equal" do

      it "returns true" do
        matcher.matches?("$ne" => "second").should be_true
      end

    end

    context "when the values are equal" do

      it "returns false" do
        matcher.matches?("$ne" => "first").should be_false
      end

    end

  end

end
