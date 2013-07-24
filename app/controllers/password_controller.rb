class PasswordController < ApplicationController
  def edit
    # @code = params[:code]
    # @user = User.new
    # find the user with the passed in code
    # then display the reset password form
    @user = User.find_by(code: params[:code])

    # if user's code expires_at is after Time.now, return error
    unless @user and @user.expires_at > Time.now
      redirect_to login_url, error: "Reset link has expired. Please try again."
    end
  end

  def update
    @user = User.find_By(code: params[:user][:code])
    # find User in

    # if user is true and user's code has not expired yet, run:
    unless @user and @user.expires_at > Time.now
      # change params hash to update password, code, expires_at
      @user.update_attributes(params[:user])  # set password
      @user.code = nil                        # remove code
      @user.expires_at = nil                  # remove expires_at
      if @user.save       # if save works, redirect to index.html
        session[:user_id] = user.id
        redirect_to root_url, notice: "Password changed successfully."
      else                # if save does not work, redirect to login
        redirect_to login_url, alert: "Reset link has expired. Please try again."
    end
  end
end