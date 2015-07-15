class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_current_page, :store_location

  # Helpers of sorts

  private

  def get_current_page
    @current_page = "#{params[:controller]}##{params[:action]}"
  end

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
      return redirect_to default_redirect
    end
  end

  def admin_management_path # for get requests
    request.path.include?('admin') || request.path == '/tidbits/new' || request.path == '/tidbits/edit'
  end
end
