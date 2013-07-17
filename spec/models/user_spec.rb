require 'spec_helper'

describe User do
  subject(:user) { Fabricate(:user) }

  it "encrypts a password" do
    fish = BCrypt::Engine.hash_secret("123", subject.salt)

    puts subject.email
    expect(subject.salt).not_to be_nil
    expect(subject.fish).to eq(fish)
  end

  it "authenticates a user" do
    authuser = User.authenticate(subject.email, "123")
    unauthuser = User.authenticate(subject.email, "")

    puts subject.email
    expect(authuser).to eq(subject)
    expect(unauthuser).to be_nil
  end
end
