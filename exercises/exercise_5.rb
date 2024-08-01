require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Total revenue for all stores
total_revenue = Store.sum(:annual_revenue)
puts "The total revenue for the company is: $#{total_revenue}"

#Average revenue for each store
average_revenue = Store.average(:annual_revenue)
puts "The average revenue per store is: $#{average_revenue}"

#Stores generating 1M or more revenue
stores_million_revenue = Store.where('annual_revenue >= ?', 1000000).count
puts "There are #{stores_million_revenue} stores generating 1 million dollars or more in revenue"
