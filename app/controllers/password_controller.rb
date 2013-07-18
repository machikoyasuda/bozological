class PasswordController < ApplicationController
  def edit
    # @code = params[:code] confirm that @code is pulling from the :code in URL
    @user = User.new
  end

  def update
  end
end
