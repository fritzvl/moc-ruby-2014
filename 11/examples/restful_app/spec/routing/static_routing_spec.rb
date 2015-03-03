require 'rails_helper'

RSpec.describe "static routing", :type => :routing do
  it "routes / to welcome#index" do
    expect(:get => "/").to route_to(
                               :controller => "welcome",
                               :action => "index"
                           )
  end

  it "routes /about to welcome#about as default" do
    expect(:get => "/about").to route_to(
                                :controller => "welcome",
                                :action => "about"
    )
  end

  it "routes /about/:department/department to welcome#about_department" do
    expect(:get => "/about/management/department").to route_to(
                                    :controller => "welcome",
                                    :action => "about_department",
                                    :department=>"management"
                                )
  end

  it "routes GET request on /contact properly " do
    expect(:get => "/contact").to route_to(
                                      :controller => "welcome",
                                      :action => "contact"
                                  )
  end

  it "routes POST request on /contact properly " do
    expect(:post => "/contact").to route_to(
                                      :controller => "welcome",
                                      :action => "send_contact"
                                  )
  end

end