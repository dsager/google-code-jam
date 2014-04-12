#!/usr/bin/env ruby
file_name = ARGV[0]
input = File.new(file_name, 'r')
input.gets.to_i.times do |n|
  a1 = input.gets.to_i - 1
  set1 = [
      input.gets.split(' '),
      input.gets.split(' '),
      input.gets.split(' '),
      input.gets.split(' ')
  ]
  row1 = set1[a1]
  a2 = input.gets.to_i - 1
  set2 = [
      input.gets.split(' '),
      input.gets.split(' '),
      input.gets.split(' '),
      input.gets.split(' ')
  ]
  row2 = set2[a2]
  intersect = row1 & row2
  case intersect.length
  when 0
    puts "Case ##{n+1}: Volunteer cheated!"
  when 1
    puts "Case ##{n+1}: #{intersect.pop}"
  else
    puts "Case ##{n+1}: Bad magician!"
  end
end
