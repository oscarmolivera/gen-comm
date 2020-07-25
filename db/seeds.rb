require 'faker'

User.create!(
  first_name: 'Oscar',
  last_name: 'Olivera',
  email: 'oscarmolivera@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)
puts 'My User created!'
User.create!(
  first_name: 'Ederson',
  last_name: 'Floriano',
  email: 'ederson@smtm.co',
  password: 'smtm1234',
  password_confirmation: 'smtm1234'
)
puts 'Ederson TestUser!'

12.times do
  Category.create!(
    name:  Faker::Lorem.word,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)
  )
end
puts '12 Dummy Categories created!'

8.times do
  Client.create!(
    name:  Faker::Name.name_with_middle,
    email:  Faker::Internet.email, 
    address:  Faker::Address.full_address,
    telephone:  Faker::PhoneNumber.phone_number_with_country_code
  )
end
puts '8 Dummy Clients created!'