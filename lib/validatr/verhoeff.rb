# frozen_string_literal: true

module Validatr
  module Verhoeff
    extend Utils

    D = [
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
      [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
      [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
      [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
      [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
      [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
      [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
      [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
      [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    ].freeze

    F = [
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
      [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
      [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
      [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
      [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
      [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
      [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
    ].freeze

    INV = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9].freeze

    # Returns true if a number is a valid Verhoeff number, false otherwise
    def self.valid?(number)
      digits = digits_from_number(number)
      c = encode(digits)
      c.zero?
    end

    # Generates the check digit for a number
    def self.check_digit(number)
      digits = digits_from_number(number)
      digits.push(0)
      c = encode(digits)
      INV[c]
    end

    def self.encode(digits)
      c = 0
      digits.reverse.map.with_index do |d, i|
        f = F[i % 8][d]
        c = D[c][f]
      end
      c
    end
  end
end
