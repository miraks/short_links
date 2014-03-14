require 'spec_helper'

describe ShortLink do
  describe ".find" do
    it "find link by id" do
      link = ShortLink.new
      link.link = 'http://vldkn.net'
      link2 = ShortLink.find link.id
      expect(link2).to eq link
    end

    it "returns nil if link not found" do
      link = ShortLink.find "some id"
      expect(link).to be_nil
    end
  end

  describe "#id" do
    it "generated for new objects" do
      link = ShortLink.new
      expect(link.id).not_to be_nil
    end

    it "keep result between calls" do
      link = ShortLink.new
      expect(link.id).to eq link.id
    end

    it "generate almost uniq ids" do
      link = ShortLink.new
      link2 = ShortLink.new
      expect(link.id).not_to eq link2.id
    end
  end

  describe "#link" do
    it "returns same value for objects with same id" do
      link = ShortLink.new
      link.link = 'http://vldkn.net'
      link2 = ShortLink.new link.id
      expect(link.value).to eq link2.value
    end
  end

  describe "#==" do
    it "returns true if objects have same id" do
      link = ShortLink.new
      link2 = ShortLink.new link.id
      expect(link).to eq link2
    end

    it "returns false if objects have different ids" do
      link = ShortLink.new
      link2 = ShortLink.new
      expect(link).not_to eq link2
    end

    it "returns false if link have different class but same id" do
      link = ShortLink.new
      fake_link = OpenStruct.new id: link.id
      expect(link).not_to eq fake_link
    end
  end

  describe "#value" do
    it "returns link as string" do
      link = ShortLink.new
      link.link = 'http://vldkn.net'
      expect(link.value).to eq 'http://vldkn.net'
    end
  end
end
