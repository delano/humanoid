require "spec_helper"

describe Humanoid::Matchers::Gt do

  describe "#matches?" do

    context "when the value is larger" do

      let(:matcher) { Humanoid::Matchers::Gt.new(5) }

      it "returns true" do
        matcher.matches?("$gte" => 3).should be_true
      end

    end

    context "when the value is smaller" do

      let(:matcher) { Humanoid::Matchers::Gt.new(5) }

      it "returns false" do
        matcher.matches?("$gte" => 10).should be_false
      end

    end

    context "when the value is nil" do

      let(:matcher) { Humanoid::Matchers::Gt.new(nil) }

      it "returns false" do
        matcher.matches?("$gte" => 5).should be_false
      end

    end

  end

end
