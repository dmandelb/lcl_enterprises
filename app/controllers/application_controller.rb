class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_filter :ensure_login, only: [:create, :show, :edit, :destroy]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
    @consignee ||= Consignee.find_by(id: session[:consignee_id])
  end

  def logged_in?
    !!current_user
  end

  private
  def ensure_login
    redirect_to root_path unless logged_in?
  end

  protect_from_forgery with: :exception
end
