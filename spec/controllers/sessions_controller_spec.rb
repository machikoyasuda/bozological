require 'spec_helper'

describe SessionsController do
  let!(:email) { "sam@stone.com" }
  let!(:pw) { "123xyz" }

  subject!(:user) { Fabricate(
    :user,
    email: email,
    password: pw,
    password_confirmation: pw
  )}

  describe "POST #create" do
    it "logs an authenticated user in and redirects to site#index" do
      post("create", email: email, password: pw)

      expect(response).to redirect_to(root_url)
    end

    it "redisplays the login form for authentication failures" do
      post("create", email: email, password: "...")

      expect(response).to render_template("new")
    end

    it "sets code and expires_at for a password reset request" do
      post("create", email: email, password: "")

      pwresetuser = User.first

      expect(pwresetuser.code).not_to be_nil
      expect(pwresetuser.expires_at).not_to be_nil
    end
  end
end