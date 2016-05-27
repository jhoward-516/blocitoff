5.times do 
    the_user = User.new(
        username: Faker::Lorem.word,
        email: Faker::Internet.email,
        password: Faker::Internet.password(8)
    )
    the_user.skip_confirmation!
    the_user.save!
end

users = User.all

dates = [Time.now, Time.now + 2.days, Time.now + 6.days]
25.times do
    item = Item.create!(
        user:   users.sample,
        name: Faker::Lorem.sentence(3, true)
    )
    
    item.update_attributes!(expire_at: dates.sample)
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