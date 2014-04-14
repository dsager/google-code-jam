#!/usr/bin/env ruby

# problem: https://code.google.com/codejam/contest/2974486/dashboard#s=p1

input = File.new(ARGV[0], 'r')
input.gets.to_i.times do |n|
  vars = input.gets.split(' ').map(&:to_f)
  cps = 2.0
  time = 0.0
  time_to_x = vars[2] / cps
  loop do
    time_to_farm = vars[0] / cps
    time_to_x_with_farm = vars[2] / (cps + vars[1])
    break if time_to_x < (time_to_x_with_farm + time_to_farm)
    cps = cps + vars[1]
    time_to_x = vars[2] / cps
    time = time + time_to_farm
  end
  time = time + time_to_x
  puts "Case ##{n+1}: #{time}"
end
