class CreditCheck

  def is_valid?(card_number)
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
    card_number.each_with_index.map do |digit, index|
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
    if card_number % 10 == 0
      "Valid Card"
    else "Invalid Card"
    end
  end
end
