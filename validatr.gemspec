# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "validatr/version"

Gem::Specification.new do |spec|
  spec.name          = "validatr"
  spec.version       = Validatr::VERSION
  spec.authors       = ["Julien Roger"]
  spec.email         = ["jroger@abletribe.com"]

  spec.summary       = "A set of tools for string and number error checking."
  spec.description   = "An implementation of several error checking algorithms,"\
                       "including Luhn and Damm."
  spec.homepage      = "https://github.com/julienroger/validatr"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w[LICENSE README.md]
  spec.executables   = spec.files.grep(%r{^bin/})   { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})  { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "rubocop", "~> 0.49"
  spec.add_development_dependency "rubocop-rspec", "~> 1.15"
end
