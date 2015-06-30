module ApplicationHelper

  def bootstrap_class_for(event_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }[event_type] || event_type.to_s
  end

end
