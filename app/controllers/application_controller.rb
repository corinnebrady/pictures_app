class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authentication

  private
  def authentication
    # @authenticated = User.find(session[:user_id]) unless session[:user_id].nil?
    # Try to find a user
    @authenticated = User.where(:id => session[:user_id])

    #In the absense of a user, clear out the session
    if @authenticated.length == 0
      session[:user_id] = nil
      @authenticated = nil
    else
      # otherwise populate @authenticated with the user.
      @authenticated = @authenticated.first
    end
  end
end
