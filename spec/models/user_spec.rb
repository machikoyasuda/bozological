require 'spec_helper'

describe User do
  before(:each) do
    @password = "123"
    @email = "joe@chicago.com"

    @user = User.create(
      email: @email,
      password: @password,
      password_confirmation: @password
    )
  end

  it "encrypts a password" do
    fish = BCrypt::Engine.hash_secret(@password, @user.salt)

    expect(@user.salt).not_to be_nil
    expect(@user.fish).to eq(fish)
  end

  it "authenticates a user" do
    authuser = User.authenticate(@email, @password)
    unauthuser = User.authenticate(@email, "")

    expect(authuser).to eq(@user)
    expect(unauthuser).to be_nil
  end
end