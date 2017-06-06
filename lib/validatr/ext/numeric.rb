# frozen_string_literal: true

class Numeric
  def valid_luhn?
    to_s.valid_luhn?
  end

  def valid_verhoeff?
    to_s.valid_verhoeff?
  end

  def valid_damm?
    to_s.valid_damm?
  end
end
