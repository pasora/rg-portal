module ApplicationHelper
  def css_namespace
    "#{params[:controller]} #{params[:action]}"
  end

  def render_title
    content_for?(:title) ? "#{content_for(:title)} | RG Portal" : 'RG Portal'
  end
end
