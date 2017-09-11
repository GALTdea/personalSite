module SetSource
  extend ActiveSupport::Concern

  included do
    before_filter :set_source
  end

# creating a variable in sessions called source and we'll equalit it to the params :q in the routes, and store it there. so that i'll be
#available in our local session. source is a random name given to it and q is also random,
  def set_source
    session[:source] = params[:q] if params[:q]
  end



end
