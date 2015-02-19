module ApplicationHelper

  # def nav_link(link_text, link_path)
  #   class_name = current_page?(link_path) ? 'current' : nil

  #   content_tag(:li, :class => class_name) do
  #     link_to link_text, link_path
  #   end
  # end

  def nav_pill_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
    class_name += ' category-button'

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
end
