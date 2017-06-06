# frozen_string_literal: true

require "spec_helper"

describe Validatr do
  example { expect(Validatr::VERSION).not_to be nil }

  shared_examples "algorithm" do
    example { expect(described_class.valid?(invalid_string)).to eq false }
    example { expect(described_class.valid?(valid_string))  .to eq true  }
    example { expect(described_class.valid?(valid_integer)) .to eq true  }
    example { expect(described_class.valid?(valid_decimal)) .to eq true  }
    example { expect(described_class.valid?(valid_float))   .to eq true  }

    example { expect(described_class.check_digit(number_string)).to eq check_digit.to_i }
  end

  let(:number_string)   { "12345678"                  }
  let(:valid_string)    { number_string + check_digit }
  let(:valid_integer)   { valid_string.to_i           }
  let(:valid_decimal)   { BigDecimal(valid_string)    }
  let(:valid_float)     { valid_string.to_f           }

  describe Validatr::Damm do
    let(:check_digit)     { "6"                         }
    let(:invalid_string)  { "123456781"                 }

    include_examples "algorithm"
  end

  describe Validatr::Luhn do
    let(:check_digit)     { "2"                         }
    let(:invalid_string)  { "123456789"                 }

    include_examples "algorithm"
  end

  describe Validatr::Verhoeff do
    let(:check_digit)     { "4"                         }
    let(:invalid_string)  { "123456785"                 }

    include_examples "algorithm"
  end
end
