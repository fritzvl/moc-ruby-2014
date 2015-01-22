require File.expand_path '../spec_helper.rb', __FILE__

#update according to your current location
MY_CITY = "Cherkasy"
OTHER_TEST_CITY = "San+Francisco"

describe "Weather API example RSpec" do

  describe "/" do

    it "should allow accessing the default route" do
      get '/'
      expect(last_response).to be_ok
    end

    it "should response with valid JSON on request to /" do
      get '/'
      expect(JSON.parse(last_response.body)).respond_to?(:keys)
    end

    it "should response with valid result on request to /" do
      get '/'
      expect(JSON.parse(last_response.body).has_key?("location")).to be true
    end


    it "should response with valid result on request to /" do
      get '/'
      expect(JSON.parse(last_response.body).has_key?("location")).to be true
      expect(JSON.parse(last_response.body)["location"]).to be == MY_CITY
    end

    it "should response with current temperature on / request" do
      get '/'
      expect(JSON.parse(last_response.body).has_key?("current")).to be true
      expect(JSON.parse(last_response.body)["current"].has_key?("temperature")).to be true
      expect(JSON.parse(last_response.body)["current"].has_key?("apparentTemperature")).to be true
    end

    it "should response with valid current temperature on / request" do
      get '/'

      expect(JSON.parse(last_response.body)["current"]["temperature"]).not_to be_nil
      expect(JSON.parse(last_response.body)["current"]["temperature"]).to be_kind_of(Float)

      expect(JSON.parse(last_response.body)["current"]["apparentTemperature"]).not_to be_nil
      expect(JSON.parse(last_response.body)["current"]["apparentTemperature"]).to be_kind_of(Float)
    end


  end

  describe "/:city" do

    it "should allow accessing the default route" do
      get "/#{OTHER_TEST_CITY}"
      expect(last_response).to be_ok
    end

    it "should response with valid JSON on request to /" do
      get "/#{OTHER_TEST_CITY}"
      expect(JSON.parse(last_response.body)).respond_to?(:keys)
    end

    it "should response with valid result on request to /" do
      get "/#{OTHER_TEST_CITY}"
      expect(JSON.parse(last_response.body).has_key?("location")).to be true
    end


    it "should response with valid result on request to /" do
      get "/#{OTHER_TEST_CITY}"
      expect(JSON.parse(last_response.body).has_key?("location")).to be true
      expect(JSON.parse(last_response.body)["location"]).to be == OTHER_TEST_CITY
    end

    it "should response with current temperature on / request" do
      get "/#{OTHER_TEST_CITY}"
      expect(JSON.parse(last_response.body).has_key?("current")).to be true
      expect(JSON.parse(last_response.body)["current"].has_key?("temperature")).to be true
      expect(JSON.parse(last_response.body)["current"].has_key?("apparentTemperature")).to be true
    end

    it "should response with valid current temperature on / request" do
      get "/#{OTHER_TEST_CITY}"

      expect(JSON.parse(last_response.body)["current"]["temperature"]).not_to be_nil
      expect(JSON.parse(last_response.body)["current"]["temperature"]).to be_kind_of(Float)

      expect(JSON.parse(last_response.body)["current"]["apparentTemperature"]).not_to be_nil
      expect(JSON.parse(last_response.body)["current"]["apparentTemperature"]).to be_kind_of(Float)
    end


  end


end