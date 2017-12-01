require "pry"
require_relative "credit_check"

cc = CreditCheck.new
p "Welcome to the Credit Card Checker."
loop do
  p "Enter a card number to check its validity or press 'control c' to quit."
  input = gets.chomp
  p cc.is_valid?(input)
end
