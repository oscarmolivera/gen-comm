module ApplicationHelper
  def toastr_flash_messages
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      type = 'info' if type == 'info'
      type = 'warning' if type == 'warning'
      text = "<script>toastr.#{type}('#{message}', '#{type.upcase}', {closeButton:true, progressBar: true});</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join('\n').html_safe
  end
end
