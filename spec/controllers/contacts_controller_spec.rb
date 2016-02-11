require 'rails_helper'

RSpec.describe ContactsController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #import" do
    it "redirects to the home page" do
      allow(Contact).to receive(:import).with("1.csv")
      post :import, file: "1.csv"
      expect(response).to redirect_to root_url
    end

    it "adds a flash notice" do
      allow(Contact).to receive(:import).with("1.csv")
      post :import, file: "1.csv"
      expect(flash[:notice]).to eq "Contacts imported."
    end

    it "imports the Contact file" do
      expect(Contact).to receive(:import).with("1.csv")
      post :import, file: "1.csv"
    end
  end

end