require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :client do |client|
    client.name { Faker::Name.name_with_middle }
    client.email { Faker::Internet.email }
    client.adress { Faker::Address.full_address }
    client.telefone { Faker::PhoneNumber.phone_number_with_country_code}
  end
end