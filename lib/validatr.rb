# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require "validatr/version"
require "validatr/utils"
require "validatr/luhn"
require "validatr/damm"
require "validatr/verhoeff"
require "validatr/ext"

module Validatr
end
