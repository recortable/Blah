module ApplicationHelper
  def title(title)
    content_for(:title) {title}
    content_tag :h2, title
  end
end
