#!/usr/bin/env ruby

filename = ARGV[0]

def find_pairs(numbers, sum)
  Array(numbers).combination(2).find_all { |a, b| a + b == sum}
end

File.open(filename, 'r') do |f|
  for line in f
    numbers, sum = line.split(';')
    sum = sum.to_i
    numbers = numbers.split(',').map(&:to_i)
    pairs = find_pairs(numbers, sum)

    output = ''

    for pair in pairs
      output += "#{pair[0]},#{pair[1]};"
    end

    if output == ''
      puts 'NULL'
    else
      puts output[0..-2]
    end
  end
end