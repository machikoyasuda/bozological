class SessionsController < ApplicationController
  before_action :is_authenticated, only: [:new]
  def new                               # looks for new.html.erb and displays it
    #render :json => session             # return sessions hash as a JSON
  end

  def create                            # authenticate new log-in session user
    user = User.authenticate(params[:email], params[:password])

    if user
        session[:user_id] = user.id
        redirect_to root_url
    else
        render :new
    end
  end

  def destroy                           # end current log-in session
  	redirect_to login_url
  end
end