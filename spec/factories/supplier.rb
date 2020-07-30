require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :supplier do |supplier|
    supplier.name { Faker::Company.name }
    supplier.email { Faker::Internet.email }
    supplier.address { Faker::Address.full_address }
    supplier.telephone { Faker::PhoneNumber.phone_number_with_country_code }
    supplier.photo { Faker::LoremFlickr.image(size: "50x60") }
  end
end