# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def load_data_from_json(file)
    file_data = File.read(file)
    JSON.parse(file_data)
end

def create_users(users)
    users.each do |user|
        User.create(name: user['name'])
    end
end

User.delete_all
create_users(load_data_from_json("#{__dir__}/jsons/users.json"))