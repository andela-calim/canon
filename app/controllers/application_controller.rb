class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :new_question
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user#, signed_in?

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: exception.message }
      format.json { render json: exception.message, status: :forbidden }
      format.js { render js: "alert('#{exception.message}');" }
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new_question
    @question = Question.new
  end
end
