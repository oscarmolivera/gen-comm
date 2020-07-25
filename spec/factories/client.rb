require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :client do |client|
    client.name { Faker::Name.name_with_middle }
    client.email { Faker::Internet.email }
    client.address { Faker::Address.full_address }
    client.telephone { Faker::PhoneNumber.phone_number_with_country_code}
  end
end