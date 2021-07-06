module ApplicationHelper

  def urls_to_content(str)
    str.gsub! (%r{https://[^\s<]+}) do |url|
      "<img src='#{url}' width='270'; />"
    end
    str.html_safe
  end

  def urls_to_links(str)
    str.gsub! (%r{https://[^\s<]+}) do |url|
      "<a href='#{url}'>#{url}</a>"
    end
  end
end
