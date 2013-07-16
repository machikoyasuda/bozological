# Set up fake user data for our user_spec.rb
# Make sure user_spec.rb has "require fabrication"

require 'ffaker'

Fabricator(:user) do
  email { Faker::Internet.email }
  password {"123"}
  password_confirmation {"123"}
end
