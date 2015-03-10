class WelcomeController < ApplicationController

  before_action :set_department, only: [:about]
  before_action :check_message, only: [:send_contact]
  before_action :ensure_correct_department, only: [:about_department]
  rescue_from ActionController::RoutingError, with: :department_not_found

  def index
    respond_to do |format|
      format.html { render "index" }
    end
  end

  def about
    respond_to do |format|
      format.html { render "about" }
    end
  end

  def about_department
    @department=params[:department]
    respond_to do |format|
      format.html { render "about" }
    end
  end

  def contact

  end

  def send_contact
    @result = contact_params
    ContactMailer.contact_email(@result).deliver_later
    respond_to do |format|
      format.html { render "send_success" }
    end
  end


  private

  def set_department
    @department = "General"
  end

  def department_not_found
    render "department_not_found"
  end


  def check_message
    if params[:name].blank? || params[:message].blank?
      flash[:error] = "Both fields Name and Message must not be blank!"
      redirect_to contact_path
    end
  end

  def ensure_correct_department
    raise ActionController::RoutingError.new("Department not found") unless ["Management", "Marketing", "Bookkeeping"].include?(params[:department].capitalize)
  end


  def contact_params
    params.permit(:name, :message)
  end

end
