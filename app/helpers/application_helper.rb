module ApplicationHelper
  def truncate_sidebar_link(link)
    truncate(link, length: 40)
  end

  def nav_pill_link(link_text, link_path)
    class_name = check_link_path(link_path) ? 'active' : ''
    class_name += ' category-button'

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

private
  def check_link_path(link_path)
    if current_page?(link_path)
      true
    elsif /\/universities\/\d+\/fraternities/.match(link_path) && params[:controller] == "fraternity_chapters"
      true
    elsif /\/universities\/\d+\/sororities/.match(link_path) && params[:controller] == "sorority_chapters"
      true
    elsif /\/universities\/\d+\/discussion/.match(link_path) && params[:controller] == "topic"
      true
    else
      false
    end
  end
end
