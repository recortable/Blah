module MessagesHelper
  def render_body(message, truncate = nil)
    text = truncate.present? ? truncate(message.body, :length => truncate) : message.body
    #text = auto_link(text)
    #text = text.gsub(/(#\w+)/, '<a>\0</a>')
    RDiscount.new(text, :smart).to_html.html_safe
  end

  def message_title(message)
    message.parent.present? ? I18n.t('messages.response.title', :title => message.title) : message.title
  end
end
