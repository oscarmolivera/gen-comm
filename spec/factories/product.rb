require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :product do |product|
    product.name { Faker::Commerce.product_name }
    product.description { Faker::Lorem.sentence(
                                word_count: 3, 
                                supplemental: true, 
                                random_words_to_add: 4
                              ) 
                          }
    product.existence { Faker::Number.between(from: 8, to: 162) }
    product.price { Faker::Commerce.price(range: 1000..600000) }
    product.image { Faker::LoremFlickr.image(size: "50x60") }
    category
    supplier
  end
end
