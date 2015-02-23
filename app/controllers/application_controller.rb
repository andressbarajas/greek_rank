class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_sidebar_vars

  helper_method :is_an_admin?

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

  def is_an_admin?
    current_user && current_user.admin?
  end

  def set_sidebar_vars 
    @posts = Article.order('created_at DESC').limit(3)
  end
end
