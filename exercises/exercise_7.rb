require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :must_carry_apparel

  # Custom validation method
  def must_carry_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:base, "Store must carry apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

# Ask the user for a store name (store it in a variable)
print "Enter a store name: "
store_name = gets.chomp

# Attempt to create a store with the inputted name
new_store = Store.new(name: store_name)

# Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
if new_store.save
  puts "New store #{new_store} has been created successfully."
else 
  puts"Failed to create store:"
  new_store.errors.full_messages.each do |message|
    puts message
  end
end
