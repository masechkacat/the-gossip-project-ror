require "faker"

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Like.destroy_all
Comment.destroy_all

10.times do
    City.create(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code
    )
  end

  10.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      description: Faker::Lorem.paragraph,
      age: Faker::Number.between(from: 18, to: 80),
      city: City.all.sample 
    )
  end

# Создаем госсипы
20.times do
    gossip = Gossip.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user: User.all.sample
    )
    
 end

 10.times do
  Tag.create(
    title: "##{Faker::Lorem.word}"
  )
end


 20.times do
  gossip = Gossip.all.sample
  user = User.all.sample # Получаем случайный госсип из базы данных
  random_model = [Gossip, Comment].sample # Случайно выбираем модель (госсип или комментарий)
  commentable = random_model.all.sample
  Comment.create(
    content: Faker::Lorem.sentence,
    user: user,
    gossip: gossip,
    commentable: commentable
  )
end

 
 20.times do
     random_model = [Gossip, Comment].sample # Случайно выбираем модель (госсип или комментарий)
     likeable = random_model.all.sample
     Like.create(
       user: User.all.sample,
       likeable: likeable
     )
 end

  10.times do
    sender = User.all.sample
    recipient = User.all.sample
    while sender == recipient do
      recipient = User.all.sample
    end
    PrivateMessage.create(
      content: Faker::Lorem.paragraph,
      sender: sender,
      recipient: recipient
    )
  end
  
