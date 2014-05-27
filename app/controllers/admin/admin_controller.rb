class Admin::AdminController < ApplicationController
  before_filter :require_login
  layout 'admin'

  def index
    render :template => 'admin/index'
  end

  private

  helper_method :current_user, :logged_in?

  def authenticator
    @authenticator ||= Authenticator.new(session)
  end

  def current_user
    @current_user ||= authenticator.load_user
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to admin_sign_in_path, notice: "Please sign in first."
    end
  end
end