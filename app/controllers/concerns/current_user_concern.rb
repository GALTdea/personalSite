module CurrentUserConcern
  extend ActiveSupport::Concern





  # super gets all the data from from the original current_user method
  # if current user doen't not exit || guess_user
  def current_user
    super || guest
  end

  #last item in the method gest returend so we wan to place the object at the end
  def guest
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end



