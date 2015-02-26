class WelcomeController < ApplicationController


  def index
    render text: "Welcome #{params[:name]}"
  end

  def about
    render text: "General 'About us' info"
  end

  def about_department
    render text: "All about #{params[:department]} department"
  end

  def contact

  end

  def send_contact

  end



end
