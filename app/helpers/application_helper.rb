module ApplicationHelper

  def show_helping_data(content)
    "<a href='#'>
      #{content}
    </a>".html_safe
  end

end
