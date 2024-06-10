# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user1 = User.find_or_create_by!(name: "Arya", email: "foo1@mengle.com")
user2 = User.find_or_create_by!(name: "Tito", email: "foo2@mengle.com")
user3 = User.find_or_create_by!(name: "Jacob", email: "foo3@mengle.com")
user4 = User.find_or_create_by!(name: "Anjali", email: "foo4@mengle.com")
user5 = User.find_or_create_by!(name: "Anjana", email: "foo5@mengle.com")
user6 = User.find_or_create_by!(name: "Rohan", email: "foo6@mengle.com")
user7 = User.find_or_create_by!(name: "Stephen", email: "foo7@mengle.com")
user8 = User.find_or_create_by!(name: "Joel", email: "foo8@mengle.com")

mistake1 = Mistake.find_or_create_by!(name: "Debugger", severity: 1, description: "Left a deug statement in the code.")
mistake2 = Mistake.find_or_create_by!(name: "Indentation", severity: 1, description: "Incorrect indentations.")
mistake3 = Mistake.find_or_create_by!(name: "Print Statement", severity: 1, description: "Left a print statement in the code.")
mistake4 = Mistake.find_or_create_by!(name: "Variable Name", severity: 1, description: "Poor use of variable name.")


userMistake1 = MistakeUser.create!(mistake_id: mistake1.id, user_id: user1.id)
userMistake2 = MistakeUser.create!(mistake_id: mistake1.id, user_id: user1.id)
userMistake3 = MistakeUser.create!(mistake_id: mistake3.id, user_id: user4.id)
userMistake4 = MistakeUser.create!(mistake_id: mistake2.id, user_id: user4.id)
userMistake5 = MistakeUser.create!(mistake_id: mistake4.id, user_id: user3.id)
userMistake6 = MistakeUser.create!(mistake_id: mistake3.id, user_id: user7.id)
