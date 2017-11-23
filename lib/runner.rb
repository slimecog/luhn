
require_relative "credit_check"

cc = CreditCheck.new
p "Welcome to the Credit Card Checker."
p "Enter a card number to check its validity."
input = gets.chomp
p cc.is_valid?(input)
# p "Enter another number to test or type quit to quit"
# input = gets.chomp
# if input == Integer
#   p cc.is_valid?(input)
# end
