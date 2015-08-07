module ApplicationHelper

  BOOTSTRAP_STATUS_MAP = { success: 'success', error: 'danger', alert: 'warning', notice: 'info' }

############# General

  # Generates alert class for bootstrap based on message type
  def bootstrap_class_for(message_type)
    "alert-#{BOOTSTRAP_STATUS_MAP[message_type.to_sym]}" || message_type.to_s
  end

  # Generates sr-only span with given text
  def sr(sr_text)
    "<span class='sr-only'>#{sr_text}</span>".html_safe
  end

  # Outputs my email address with the top-secret, bot-interruption technique applied
  def my_email
    "<span class='k7r-color'>katie.k7r<span class='hidden'>shhhh</span>@gmail.com</span>".html_safe
  end

############# Nav

  # Checks whether current page is (static#)home
  def about?
    params[:action] == 'about'
  end

  # Checks whether current page is (static#)home
  def home?
    params[:action] == 'home'
  end

  # Checks whether current page is (static#)portfolio
  def portfolio?
    params[:action] == 'portfolio'
  end

  # Checks whether current page is tidbits#index
  def tidbits?
    params[:controller] == 'tidbits' && params[:action] == 'index'
  end

  # # Checks whether current page is an admin page
  # def admin?
  #   params[:controller] == 'tidbits' && params[:action] != 'index'
  # end

end
