module BootstrapFlashHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def bootstrap_flash_fixed
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym # this is needed because it comes in as a String for some reason...
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                               msg, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
