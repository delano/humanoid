require "spec_helper"

describe Humanoid::Commands::Create do

  describe "#execute" do

    before do
      @document = stub(:run_callbacks)
    end

    it "executes a save command" do
      Humanoid::Commands::Save.expects(:execute).with(@document, true).returns(@document)
      Humanoid::Commands::Create.execute(@document)
    end

    it "runs the before and after create callbacks" do
      @document.expects(:run_callbacks).with(:before_create)
      Humanoid::Commands::Save.expects(:execute).with(@document, true).returns(@document)
      @document.expects(:run_callbacks).with(:after_create)
      Humanoid::Commands::Create.execute(@document)
    end

    it "returns the document" do
      Humanoid::Commands::Save.expects(:execute).with(@document, true).returns(@document)
      Humanoid::Commands::Create.execute(@document).should == @document
    end

  end

end
