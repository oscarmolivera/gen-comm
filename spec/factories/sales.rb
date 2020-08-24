require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :sale do |sale|
    sale.amount { Faker::Commerce.price(range: 0..150000.0) }
    user
    client
  end
end