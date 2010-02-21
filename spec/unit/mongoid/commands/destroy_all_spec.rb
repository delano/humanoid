require "spec_helper"

describe Humanoid::Commands::DestroyAll do

  describe "#execute" do

    before do
      @doc = mock
      @docs = [@doc]
      @klass = stub(:name => "Person")
      @conditions = { :conditions => { :title => "Sir" } }
      @expected = { :conditions => { :title => "Sir", :_type => "Person" } }
    end

    it "destroys each document that the criteria finds" do
      @klass.expects(:find).with(:all, @expected).returns(@docs)
      Humanoid::Commands::Destroy.expects(:execute).with(@doc)
      Humanoid::Commands::DestroyAll.execute(@klass, @conditions)
    end

  end

end
