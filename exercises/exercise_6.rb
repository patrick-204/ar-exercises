require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(
  first_name: "Khurram", 
  last_name: "Virani", 
  hourly_rate: 60
)

@store1.employees.create(
  first_name: "Sarah", 
  last_name: "Johnson", 
  hourly_rate: 50
)

@store1.employees.create(
  first_name: "Paul", 
  last_name: "Smith", 
  hourly_rate: 55
)

puts "Employees for Burnaby store:"
@store1.employees.each do |employee|
  puts "#{employee.first_name} #{employee.last_name} - Hourly Rate: #{employee.hourly_rate}"
end

puts "Employees for Richmond store:"
@store2.employees.each do |employee|
  puts "#{employee.first_name} #{employee.last_name} - Hourly Rate: #{employee.hourly_rate}"
end
