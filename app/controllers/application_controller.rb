class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :store_location

  # Helpers of sorts

  private

  def store_location
    return unless request.get?

    unless admin_management_path || request.xhr?
      session[:previous_url] = request.fullpath
    end
  end

  def default_redirect
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(resource)
    default_redirect
  end

  def after_sign_out_path_for(resource)
    default_redirect
  end

  def restrict_to_admin
    unless current_admin
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to default_redirect and return
    end
  end

  def admin_management_path # for get requests
    request.path.include?('admin') || (params[:controller] == 'tidbits' && params[:action] != 'index') # request.path == '/tidbits/new' || request.path == '/tidbits/edit'
  end
end
