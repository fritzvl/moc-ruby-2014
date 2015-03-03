require "rails_helper"

describe WelcomeController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("about")
    end

    it "sets correctly @department variable value" do
      get :about
      expect(assigns(:department)).to eq("General")
    end
  end


  describe "GET #contact" do

    it "responds successfully with an HTTP 200 status code" do
      get :contact
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("contact")
    end

    it "works if parameters needed passed correctly" do
      post :send_contact, {:name => "Test", message: "Test message"}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("send_success")
    end

    it "forces form refill if parameters needed passed correctly" do
      post :send_contact, {:name => "Test"}
      expect(response).to redirect_to(contact_path)
    end

    it "passes correct parameters accessible inside #send_contactaction " do
      request = {:name => "Test", :message => "Test message"}
      post :send_contact, {:name => "Test", :message => "Test message"}
      expect(assigns(:result)).to match(request)
    end

    it "not passes correct parameters accessible inside #send_contactaction " do
      request = {:name => "Test", :message1 => "Test message"}
      post :send_contact, {:name => "Test", :message => "Test message"}
      expect(assigns(:result)).not_to match(request)
      expect(assigns(:result)[:name]).to eq(request[:name])
    end

  end

end