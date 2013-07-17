class SessionsController < ApplicationController
  #before_action :is_authenticated, only: [:new]
  def new                               # looks for new.html.erb and displays it
    #render :json => session            # return sessions hash as a JSON
  end

  def create                            # authenticate new log-in session user
    if params[:password].blank?         # if password is blank, then:
      user = User.find_by(email: params[:email])

      if user
          user.code = SecureRandom.urlsafe_base64 # set user.code
          puts user
          puts user.code
          user.expires_at = Time.now + 4.hours    # set expiration date
          puts user.expires_at
          user.save                               # save user
      end

      render :new                       # go to new session log_in page
    else                                # if password is not blank, then:
      user = User.authenticate(params[:email], params[:password])
                                        # authenticate User's email, password
      if user
        session[:user_id] = user.id     # add user.id to sessions hash
        redirect_to root_url
      else
        render :new
      end
    end
  end

  def destroy                           # end current log-in session
  	session[:user_id] = nil
    redirect_to login_url
  end
end