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

  # Checks whether current page is tidbits(#any)
  def tidbits?
    params[:controller] == 'tidbits'
  end

end
