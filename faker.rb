require 'faker'
require 'faker_japanese'

Faker::Config.locale = :ja

def faker_kana_name
  first_name = Faker::Name.first_name.kana
  last_name = Faker::Name.last_name.kana
  head_char = last_name.chars.first

  [head_char, "#{last_name} #{first_name}"]
  # => ["オ", "オクヤマ アオイ"]
end

puts 'faker_name_list = ['
30.times do
  print '  '
  print "#{faker_kana_name},\n"
end
puts ']'
