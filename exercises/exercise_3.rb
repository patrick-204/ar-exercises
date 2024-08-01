require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

@store3 = Store.find(3)

@store3.destroy

store_count = Store.count
puts "There are now #{store_count} stores"
