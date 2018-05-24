#!/usr/bin/env ruby
result = ARGV.first.split(' ').group_by do |item|
  item =~ /-?\d/
end.values.each_slice(2).map do|arguments, operations|
  arguments.map do |arg|
    "(#{arg}"
  end.zip(operations).join + ")" * arguments.count
end.first

puts eval(result)
