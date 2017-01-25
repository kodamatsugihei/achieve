# 100.times do |n|
#     email = Faker::Internet.email
#     name = Faker::Name.name
#     password = "password"
#     User.create(email: email,
#                 password: password,
#                 password_confirmation: password,
#                 name: name
#                 )
# end

n = 1
    while n <= 100
        Blog.create(
            title: Faker::Lorem.sentence,
            content: Faker::Lorem.sentence,
            user_id: n
        )
        n = n + 1
    end