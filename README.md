# Validatr

An implementation of several error checking algorithms, including Luhn and Damm, for string and number error checking.

This gem currently only supports validation of integers and strings of integers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "validatr"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validatr

## Usage


```ruby
require "validatr"

Validatr::Luhn.check_digit 12345678     # => 2
Validatr::Verhoeff.check_digit 12345678 # => 4
Validatr::Damm.check_digit 12345678     # => 6

Validatr::Luhn.valid? 123456782         # => true
Validatr::Verhoeff.valid? 123456784     # => true
Validatr::Damm.valid? 123456786         # => true

123456782.valid_luhn?                   # => true
123456782.valid_verhoeff?               # => false
123456782.valid_damm?                   # => false

(123456784.0).valid_luhn?               # => false
(123456784.0).valid_verhoeff?           # => true
(123456784.0).valid_damm?               # => false

"123456786".valid_luhn?                 # => false
"123456786".valid_verhoeff?             # => false
"123456786".valid_damm?                 # => true
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/julienroger/validatr.


## License

[MIT](./LICENSE)

Copyright (c) 2017 Julien Roger
