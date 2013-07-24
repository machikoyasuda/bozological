class PasswordMailer < ActionMailer::Base
  default from: "no-reply@bozological.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset_email.subject
  #

  def reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Yo!!!!!!!!! Change your credentials')
  end
  # this method is running on sessions_controller.rb, in create
end
