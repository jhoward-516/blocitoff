5.times do 
    User.create!(
        username: Faker::Lorem.word,
        email: Faker::Internet.email,
        password: Faker::Internet.password(8)
    )
end

users = User.all

25.times do
    Item.create!(
        user:   users.sample,
        name: Faker::Lorem.sentence(3, true)
    )
end

user = User.first
 user.update_attributes!(
   username: 'JoHo',
   email: 'longhornjoho@gmail.com',
   password: 'pa55word'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"