# frozen_string_literal: true

# Factory Model Tenant
FactoryBot.define do
  factory :tenant do
    firstname       { Faker::Name.first_name }
    lastname        { Faker::Name.last_name }
    email           { Faker::Internet.email }
    phone_number    { Faker::PhoneNumber.phone_number }
    subdomain       { Faker::Lorem.word}
    password        "qwerty123"
    password_confirmation "qwerty123"
  end
end
