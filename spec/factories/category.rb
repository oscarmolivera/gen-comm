require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :category do |category|
    category.name { Faker::Lorem.word }
    category.description { Faker::Lorem.sentence(
                                                  word_count: 3, 
                                                  supplemental: true, 
                                                  random_words_to_add: 4
                                                ) 
                          }
  end
end