# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO: faker_name_list を使って初期データを投入する
require_relative './faker_name_list'
Name.destroy_all
FakerNameList::FAKER_NAME_LIST.each do |initial, name|
  #   Children.create!(head_yomi: head_yomi, name: name)
  Name.create!(initial: initial, name: name)
end
