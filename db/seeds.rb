puts '~~~destroying database~~~'
[Vote, Comment, Contribution, Speech, User, Speaker, Category].each(&:destroy_all)

# our users
puts '~~~creating admin users~~~'
User.create({
  username: 'Alfonso',
  email: 'alfons@speechless.com',
  password: '123456',
  admin: true
})
User.create({
  username: 'Lepetitbelge',
  email: 'chris@speechless.com',
  password: '123456',
  admin: true
})
User.create({
  username: 'Davidof',
  email: 'david@speechless.com',
  password: '123456',
  admin: true
})

# if Rails.env = "development"
puts '~~~creating random users~~~'
#random users
20.times do
  user = User.create(
    username: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: '123456',
    admin: false,
    photo_url: UiFaces.face
    )
end

# Activism, Technology
#categories
%w[Politics Sports History Antiquity Fiction Economics Celebrities].each { |category| Category.create(name: category) }

#speakers
Speaker.create(
  first_name: 'Socrates',
  date_of_birth: Time.new(-470),
  date_of_death: Time.new(-399)
  )
Speaker.create(
  first_name: 'Mahatma',
  last_name: 'Gandhi',
  date_of_birth: Date.parse('2-10-1869'),
  date_of_death: Date.parse('30-1-1948')
  )
Speaker.create(
  first_name: 'David',
  last_name: 'Ben-Gurion',
  date_of_birth: Date.parse('16-10-1886'),
  date_of_death: Date.parse('1-12-1973')
  )
Speaker.create(
  first_name: 'Martin Luther',
  last_name: 'King Jr.',
  date_of_birth: Date.parse('15-1-1929'),
  date_of_death: Date.parse('4-4-1968')
  )
Speaker.create(
  first_name: 'Alex',
  last_name: 'Ferguson',
  date_of_birth: Date.parse('31-12-1941')
  )
Speaker.create(
  first_name: 'Donald',
  last_name: 'Trump',
  date_of_birth: Date.parse('14-6-1946')
  )
Speaker.create(
  first_name: 'Benjamin',
  last_name: 'Netanyahu',
  date_of_birth: Date.parse('21.10.1949')
  )
Speaker.create(
  first_name: 'Angela',
  last_name: 'Merkel',
  date_of_birth: Date.parse('17-7-1954')
  )
Speaker.create(
  first_name: 'Steve',
  last_name: 'Jobs',
  date_of_birth: Date.parse('24-5-1955'),
  date_of_death: Date.parse('5-10-2011')
  )
Speaker.create(
  first_name: 'Barack',
  last_name: 'Obama',
  date_of_birth: Date.parse('4-8-1961')
  )
Speaker.create(
  first_name: 'Sundar',
  last_name: 'Pichai',
  date_of_birth: Date.parse('1-1-1972')
  )
Speaker.create(
  first_name: 'Leonardo',
  last_name: 'DiCaprio',
  date_of_birth: Date.parse('11-11-1974')
  )
Speaker.create(
  first_name: 'Greta',
  last_name: 'Thunberg',
  date_of_birth: Date.parse('3-1-2003')
  )
10.times do
  Speaker.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday
  )
end


50.times do
  content = ""
  rand(8..45).times do
    content += Faker::Lorem.paragraph_by_chars(rand(15..500)) + "\n"
  end
  Speech.create({
    title: Faker::Lorem.words(rand(4..7)).join(" ").capitalize,
    date: Faker::Date.backward,
    country: Faker::Address.country,
    city: Faker::Address.city,
    content: content,
    duration: [nil, rand(120..4000)].sample,
    category_id: Category.all.sample.id,
    speaker_id: Speaker.all.sample.id
  })
end

#contributions with comments and votes
Speech.all.each do |speech|
  5.times do
    start_position = rand(1..speech.content.length/2)
    contribution = Contribution.create(
      start_position: start_position,
      end_position: rand(start_position..speech.content.length),
      speech_id: speech.id,
      user_id: User.all.sample.id,
      content: Faker::Lorem.paragraph
      )
    if contribution.persisted?
      rand(1..5).times do
        vote = Vote.new(value: 1)
        vote.votable = contribution
        vote.user = User.all.sample
        vote.save
      end
      3.times do
        comment = Comment.create(
          user_id: User.all.sample.id,
          contribution_id: contribution.id,
          content: Faker::Lorem.sentence
          )
        if comment.persisted?
          rand(1..5).times do
            vote = Vote.new(value: 1)
            vote.votable = comment
            vote.user = User.all.sample
            vote.save
          end
        end
      end
    end
  end
end

puts "~~~~~~~~~~~~~~~"
puts "#{User.count} users"
puts "#{Speaker.count} speakers"
puts "#{Category.count} categories"
puts "#{Speech.count} speeches"
puts "#{Contribution.count} contributions"
puts "#{Comment.count} comments"
puts "#{Vote.count} votes"
puts "~~~~~~~~~~~~~~~"




