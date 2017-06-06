# frozen_string_literal: true

module Validatr
  module Luhn
    extend Utils

    def self.valid?(number, n = 10)
      digits = digits_from_number(number)
      sum = sum_digits(digits)
      (sum % n).zero?
    end

    def self.check_digit(number, n = 10)
      digits = digits_from_number(number)
      digits.push(0)
      sum = sum_digits(digits)
      (sum * 9) % n
    end

    def self.sum_digits(digits)
      digits.reverse.map.with_index do |d, i|
        if i.even?
          d
        else
          (d < 5 ? (d * 2) : ((d * 2) % 10) + 1)
        end
      end.inject(:+)
    end
  end
end
