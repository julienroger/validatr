# frozen_string_literal: true

module Validatr
  module Utils
    def digits_from_number(number)
      number.to_i.to_s.chars.map(&:to_i)
    end
  end
end
