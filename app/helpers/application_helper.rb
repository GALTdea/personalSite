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


end
