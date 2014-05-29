module ApplicationHelper

  def devise_links
    if current_producer

      link_to 'Log Out', destroy_producer_session_path, method: :delete
    else
      link_to 'Log In', new_producer_session_path
    end
  end

  def full_title(page_title)
    base_title = "CarbonClub"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
