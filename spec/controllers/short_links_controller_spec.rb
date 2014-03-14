require 'spec_helper'

describe ShortLinksController do
  describe "#show" do
    it "redirects to link value" do
      link = ShortLink.new
      link.link = 'http://vldkn.net'
      get :show, id: link.id
      expect(response).to redirect_to 'http://vldkn.net'
    end

    it "returns 404 if link not found" do
      get :show, id: "some id"
      expect(response.status).to eq 404
    end
  end

  describe "#create" do
    it "creates new link" do
      post :create, value: 'http://vldkn.net'
      body = JSON.parse response.body
      expect(body['link']).to match %r{/s/\w{8}}
      id = body['link'].split('/').last
      link = ShortLink.find id
      expect(link).not_to be_nil
    end
  end
end
