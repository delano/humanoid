require "spec_helper"

describe Humanoid::Cursor do

  let(:collection) do
    stub.quacks_like(Humanoid::Collection.allocate)
  end

  let(:proxy) do
    stub.quacks_like(Mongo::Cursor.allocate)
  end

  let(:cursor) do
    Humanoid::Cursor.new(Person, collection, proxy)
  end

  (Humanoid::Cursor::OPERATIONS - [ :timeout ]).each do |name|

    describe "##{name}" do

      before do
        proxy.expects(name)
      end

      it "delegates to the proxy" do
        cursor.send(name)
      end
    end
  end

  describe "#collection" do

    it "returns the humanoid collection" do
      cursor.collection.should == collection
    end
  end

  describe "#each" do

    before do
      proxy.expects(:each).yields({ "_type" => "Person" })
    end

    it "yields to the next document" do
      cursor.each do |doc|
        doc.attributes.except(:_id).should == Person.new.attributes.except(:_id)
      end
    end
  end

  describe "#next_document" do

    before do
      proxy.expects(:next_document).returns({ "_type" => "Person" })
    end

    it "returns the next document from the proxied cursor" do
      doc = cursor.next_document
      doc.attributes.except(:_id).should == Person.new.attributes.except(:_id)
    end
  end

  describe "#to_a" do

    before do
      proxy.expects(:to_a).returns([{ "_type" => "Person" }])
    end

    it "converts the proxy cursor to an array of documents" do
      docs = cursor.to_a
      docs[0].attributes.except(:_id).should == Person.new.attributes.except(:_id)
    end
  end
end
