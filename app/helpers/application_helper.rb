module ApplicationHelper

#  return the full title on a per-page basisi

  def full_title(page_title = '')
    base_title = "Ruby On Rails"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


end
