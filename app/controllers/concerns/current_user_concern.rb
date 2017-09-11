module CurrentUserConcern
  extend ActiveSupport::Concern





  # super gets all the data from from the original current_user method
  # if current user doen't not exit || guess_user
  def current_user
    super || guess_user
  end

  def guess_user
    OpenStruct.new(name: 'Guess User',
                  first_name: 'Guess',
                  last_name: 'User',
                  email: 'guess@example.com' )
  end
end



