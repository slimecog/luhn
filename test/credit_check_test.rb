require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/credit_check"

class CreditCheckTest < Minitest::Test

  def test_it_exists
    skip
    cc = CreditCheck.new

    assert_instance_of CreditCheck, cc
  end

  def test_card_number_can_be_split_and_reversed
    skip
    cc = CreditCheck.new

    assert_instance_of Array, cc.split_and_reverse_card_number(123456789)
    assert_equal ["9", "8", "7", "6", "5", "4", "3", "2", "1"], cc.split_and_reverse_card_number(123456789)
  end

  def test_card_number_can_have_every_other_digit_doubled
    skip
    cc = CreditCheck.new

    number = cc.split_and_reverse_card_number(123456789)

    assert_equal [9, 16, 7, 12, 5, 8, 3, 4, 1], cc.double_every_second_digit(number)
  end

  def test_two_digit_indices_can_be_simplified
    skip
    cc = CreditCheck.new

    number = cc.split_and_reverse_card_number(123456789)
    number = cc.double_every_second_digit(number)

    assert_equal [9, 7, 7, 3, 5, 8, 3, 4, 1], cc.convert_double_digit_indices_to_single_digit(number)
  end

  def test_digits_can_be_summed
    skip
    cc = CreditCheck.new

    number = cc.split_and_reverse_card_number(123456789)
    number = cc.double_every_second_digit(number)
    number = cc.convert_double_digit_indices_to_single_digit(number)

    assert_equal 47, cc.sum_the_digits(number)
  end

  def test_validity_can_be_accessed
    skip
    cc = CreditCheck.new

    number = cc.split_and_reverse_card_number(123456789)
    number = cc.double_every_second_digit(number)
    number = cc.convert_double_digit_indices_to_single_digit(number)
    number = cc.sum_the_digits(number)

    assert_equal "Invalid Card", cc.check_validity(number)

    number = cc.split_and_reverse_card_number(5541808923795240)
    number = cc.double_every_second_digit(number)
    number = cc.convert_double_digit_indices_to_single_digit(number)
    number = cc.sum_the_digits(number)

    assert_equal "Valid Card", cc.check_validity(number)

    number = cc.split_and_reverse_card_number(5541801923795240)
    number = cc.double_every_second_digit(number)
    number = cc.convert_double_digit_indices_to_single_digit(number)
    number = cc.sum_the_digits(number)

    assert_equal "Invalid Card", cc.check_validity(number)
  end

  def test_is_valid_runs_all_methods
    cc = CreditCheck.new

    assert_equal "Valid Card", cc.is_valid?(5541808923795240)
    assert_equal "Invalid Card", cc.is_valid?(5541801923795240)
  end
end
