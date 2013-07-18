class UsersController < ApplicationController
  def index           # LIST localhost:3000/users display all users
    @users = User.all.order("ID ASC") #.all is a method on ActiveRecord base object
                      # ActiveRecord SQL command .order orders by "ID" in ASC
                      # @users variable is available at index.html.erb
  end

  def show            # READ localhost:3000/users/show/[:id] show individual user
    # render :text => params[:id] test whether app can find :id parameters
    @user = User.find params[:id] # @user = User with the parameter :id
                                  # .find finds user with specific parameter id
  end

  def new             # localhost:3000/new, new.html.erb shows registration page
    @user = User.new  # @user is a new user
  end                 # now, need to create to save.

  def create          # POSTS after User.new, need to create and save
    @user = User.create user_params #user_params = private method for strong parameters

    if @user          # if @user was created correctly, redirect them to users_path
      redirect_to users_path, status:303
    else
      render :new     # if it didn't, display the new page again
    end
  end

  def edit            # localhost:3000/users/[:id]/edit
    @user = User.find params[:id] # @user is the variable for the id with user
  end

  def update        # PUTS
    @user = User.find params[:id] # find user with id
                                            # strong parameters defaults to not allow attributes to be changed with mass assignment
    if @user.update_attributes(user_params) # update user's params with new method, user_params
      redirect_to users_path, status:303    # if successful, redirect to user
    else
      render :edit
    end
  end

  def destroy        # DELETE
    user = User.find params[:id]        # find user with id
    user.destroy                        # delete it
    redirect_to users_path, status:303
  end

  private

  def user_params # define user_params method to white-list attributes that are allowed to be changed
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
