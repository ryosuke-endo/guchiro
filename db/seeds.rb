# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@guchiro.com',
            password: 'password',
            admin: true)

grumble = <<EOS
ああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああ
EOS

10000.times do |n|
  body = grumble
  Grumble.create(body: body,
                 created_at: n.days.ago,
                 user_id: 1)
end
