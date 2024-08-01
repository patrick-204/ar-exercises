require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

@store1 = Store.find(1)

@store2 = Store.find(2)

@store1.update(name: "Kelowna")

puts "#{@store1}"
puts "#{@store2}"
puts "Store 1 new name is: #{@store1.name}"
