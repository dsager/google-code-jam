#!/usr/bin/env ruby

# problem: https://code.google.com/codejam/contest/2974486/dashboard#s=p2

def get_factor(i, max)
  (1..i).select { |n| (i % n).zero? }.reverse.each { |n| return n if n <= max}
end

def get_grid(r, c, x)
  grid = Array.new(r) { Array.new(c) { '*' } }
  if x != 1
    i = get_factor(x, r)
    j = x / i
    i.times do |ii|
      j.times do |jj|
        grid[ii][jj] = '.'
      end
    end
  end
  grid[0][0] = 'c'
  grid
end

def get_simple_grid(r, c, m)
  m_count = 0
  grid = Array.new(r) do
    Array.new(c) do
      if m_count < m
        m_count = m_count + 1
        '*'
      else
        '.'
      end
    end
  end
  grid[r - 1][c - 1] = 'c'
  grid
end

input = File.new(ARGV[0] || 'sample.in', 'r')
input.gets.to_i.times do |n|
  puts '--------------------'
  puts "Case ##{n+1}:"
  r, c, m = input.gets.split(' ').map(&:to_i)
  x = (r * c) - m
  puts "#{r} x #{c}, m=#{m}, x=#{x}"
  if x == 1 || r == 1 || c == 1
    puts get_simple_grid(r, c, m).map(&:join).join("\n")
  # elsif x >= 4 && ((x / 2.0).modulo(1) == 0 || Math.sqrt(x).modulo(1) == 0)
  elsif x >= 8 || x == 4 || x == 6
    # grid = get_grid(r, c, x)
    if x < c * 2 - 1
      grid = get_grid(r, c, x)
    else
      grid = get_simple_grid(r, c, m)
      # second_last_row = grid[r - 2].count { |i| i == '.' }
      # last_row = grid[r - 1].count { |i| i == '.' } + 1
      # shuffle = ((last_row - second_last_row) / 2).floor
      # shuffle.times do |i|
      #   grid[r - 2][c - second_last_row - i - 1] = '.'
      #   grid[r - 1][(c + i) - last_row] = '*'
      # end
    end
    puts grid.map(&:join).join("\n")
  else
    puts 'Impossible'
    # puts get_simple_grid(r, c, m).map(&:join).join("\n")
  end
end
input.close
