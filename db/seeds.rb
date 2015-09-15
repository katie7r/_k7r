admin = Admin.where(email: 'katie@test.org', first_name: 'Katie', last_name: 'Russ', username: 'kt7r').first_or_initialize
admin.password = admin.password_confirmation = 'testing123'
admin.save!

def coin_flip
  [true, false].sample
end

def content
  c = Faker::Lorem.sentence(5)
  rand(2..10).times{ c += " #{Faker::Lorem.sentence(rand(2..10))}." }
  return c
end

tidbits = []
10.times do
  tidbit = {}
  tidbit[:author_id] = admin.id
  tidbit[:category]  = Tidbit.categories.keys.sample
  tidbit[:published] = coin_flip

  tidbit[:title]     = "#{tidbit[:category].capitalize}: #{Faker::Name.title} [#{tidbit[:published] ? 'Pub' : 'Unpub'}]"
  tidbit[:content]   = content
  tidbit[:more_info] = Faker::Lorem.paragraph(3, true, 7)
  tidbit[:more_info_link] = Faker::Internet.url('google.com')

  tidbits << tidbit
end

Tidbit.create(tidbits)
