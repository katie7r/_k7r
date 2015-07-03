class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :store_location

  # Helpers of sorts

  private

  def store_location
    return unless request.get?
    session[:previous_url] = request.fullpath unless request.path.include?('/admin/') || request.xhr?
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
      flash[:alert] = 'You are not authorized to perform this action.'
      return redirect_to default_redirect
    end
  end
end
