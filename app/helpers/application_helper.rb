module ApplicationHelper
  def authentication_menu
    # Build a list of links depending on the user's permissions.
    links = ""
    if @authenticated.present?
      links += "<li>#{ link_to('Users', users_path)}</li>"
      links += "<li>#{ link_to('My Profile', user_path(@authenticated))}</li>"
      links += "<li>#{ link_to('New Picture', new_picture_path)}</li>"
      # links += "<li>#{ link_to('My Favourites', favourites_path(@authenticated) )}</li>"
      links += "<li>#{ link_to('Logout ' + @authenticated.username, login_path, :method => 'delete',
                      :confirm => 'Are you sure?') }</li>"
    else
      links += "<li>#{ link_to('Create Account', new_user_path) }</li>"
      links += "<li>#{ link_to('Login', login_path) }</li>"
    end

    links
  end
end
