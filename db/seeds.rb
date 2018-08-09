
# 1.times do |i|
# User.create!(
#   name: "Admin",
#   address: Faker::Address.full_address,
#   email: "admin@chefy.com",
#   remote_avatar_url: "https://randomuser.me/api/portraits/#{["men", "women"].sample}/10.jpg",
#   password: "123456",
#   password_confirmation: "123456",
# )
# 50.times do |i|
#   User.create!(
#     name: Faker::Name.name,
#     address: Faker::Address.full_address,
#     email: "example-#{i}@chefy.com",
#     remote_avatar_url: "https://randomuser.me/api/portraits/#{["men", "women"].sample}/#{i}.jpg",
#     password: "123456",
#     password_confirmation: "123456",
#   )
# end

# name_category = ["Ăn sáng", "Ăn vặt", "Khai vị", "Món chay", "Món chính", "Lẩu", "Làm Bánh", "Bún - Mì - Phở", "Thức uống", "Salad", "Snacks", "Nước chấm"]

# name_category.each do |cate|
#   name = cate
#   Category.create!(name: name)
# end
# 100.times do
# Recipe.create(
#   name: Faker::Food.dish,
#   description: Faker::Food.description,
#   user_id: Faker::Number.between(User.first.id, User.last.id),
#   remote_cover_photo_url: "https://loremflickr.com/800/500/food",
#   purpose: "n0thing",
#   ready_in: Faker::Number.between(1, 12) * 10,
#   difficult_level: ["Khó", "Trung bình", "Dễ"].sample,
#   people_num: Faker::Number.between(1, 12),
#   )
# end

# 600.times do
#   RecipeIngredient.create!(
#     amount: Faker::Number.between(1, 10) ,
#     measurement: ["kg","gram", "thìa", "bát", "lít", "lá", "quả", "miếng"].sample,
#     recipe_id: Faker::Number.between(Recipe.first.id, Recipe.last.id),
#     name: Faker::Food.ingredient
#     )
# end

# 100.times do
#   CategoryRecipe.create(
#     category_id: Faker::Number.between(Category.first.id,Category.last.id),
#     recipe_id: Faker::Number.between(Recipe.first.id, Recipe.last.id)
#     )
#   end

# 400.times do
#   Step.create!(
#     recipe_id: Faker::Number.between(Recipe.first.id, Recipe.last.id),
#     content: Faker::Food.description
#     )
# end

# users = User.all
# user  = users.last
# following = users[1..50]
# followers = users[1..30]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

