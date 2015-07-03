module ApplicationHelper

  BOOTSTRAP_STATUS_MAP = { success: 'success', error: 'danger', alert: 'warning', notice: 'info' }

  def bootstrap_class_for(message_type)
    "alert-#{BOOTSTRAP_STATUS_MAP[message_type.to_sym]}" || message_type.to_s
  end

end
