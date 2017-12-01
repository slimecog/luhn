require "pry"
class CreditCheck

  def is_valid?(card_number)
    if card_number.to_s.chars.first.to_i == 3
      p "Checking validity of American Express card..."
    elsif card_number.to_s.chars.first.to_i == 4
      p "Checking validity of Visa card..."
    elsif card_number.to_s.chars.first.to_i == 5
      p "Checking validity of MasterCard..."
    elsif card_number.to_s.chars.first.to_i == 6
      p "Checking validity of Discover card..."
    else "Not Sure"
    end
    check_validity(
      sum_the_digits(
        convert_double_digit_indices_to_single_digit(
          double_every_second_digit(
            split_and_reverse_card_number(card_number)))))
  end

  private

  def split_and_reverse_card_number(card_number)
    card_number = card_number.to_s.split("").reverse
  end

  def double_every_second_digit(card_number)
    card_number.each_with_index.map do |digit, index|
      if index % 2 == 0
        digit = digit.to_i
        elsif index % 2 != 0
        digit = digit.to_i * 2
      end
    end
  end

  def convert_double_digit_indices_to_single_digit(card_number)
    card_number.map do |digit|
      if digit >= 10
        digit = digit - 9
      else digit = digit
      end
    end
  end

  def sum_the_digits(card_number)
    sum = 0
    card_number.each { |digit| sum += digit }
    sum
  end

  def check_validity(card_number)
    binding.pry
    if card_number % 10 == 0
      "Valid Card"
    else "Invalid Card"
    end
  end
end
