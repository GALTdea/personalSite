module ApplicationHelper
  def log_in_helper style = ''
     if current_user.is_a?(GuestUser)
        (link_to'login',  new_user_session_path, class: style) +
         " ".html_safe +
        (link_to 'register', new_user_registration_path, class: style)

      else
        link_to 'logout', destroy_user_session_path, method: :delete, class: style
      end
  end

  def nav_generator style, tag_type
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path} " > Home </#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}"  > About me </#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class= "#{style} #{active? contact_path} " > Contact </#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class= "#{style} #{active? blogs_path} "> Blog </#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class= #{style} #{active? portfolios_path} " > Portfolio </#{tag_type}>
NAV

nav_links.html_safe
  end


  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end


  def source_helper(layout_name)
     if session[:source]
      greeting = "Thanks for vissing from #{ session[:source]} and you are on the #{layout_name} layout"
       content_tag(:p, greeting, class: "source-greeting")
     end
  end

  #basic helpers like this, should go here instead of making a concern
  def copyright_generator
   PersonalSiteViewTool::Renderer.copyright 'Gustavo Valenzuela', 'All rights reserved.'
  end


  def active? path
    "active" if current_page? path
  end


  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice] )

    if alert
      alert_generator alert
    end
  end


  def alert_generator msg
    js add_gritter(msg, :title => "Gustavo Valenzuela!")
  end

end















