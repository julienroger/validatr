# frozen_string_literal: true

class String
  def valid_luhn?
    Validatr::Luhn.valid? self
  end

  def valid_verhoeff?
    Validatr::Verhoeff.valid? self
  end

  def valid_damm?
    Validatr::Damm.valid? self
  end
end
