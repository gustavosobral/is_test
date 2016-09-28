module ApplicationHelper
  # Returns the correct bootstrap class to each flash message type
  def alert_class(type)
    case type.to_sym
      when :error, :errors, :alert
        'alert-danger'
      when :success, :notice
        'alert-success'
      when :warning
        'alert-warning'
      else
        'alert-info'
    end
  end
end
