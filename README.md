# AndOr

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'and_or'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install and_or

## Usage

引数の型は配列。

[A B, C] => (A and B) or C
[A B, C D, E] => (A adn B) or (C and D) or E

andor = AndOr.new("test1 test2, test3")
andor.classify
target_content = "This is test1."
andor.check_single(target_content)
andor.check_multi(target_content)
andor.result




## Contributing

1. Fork it ( https://github.com/[my-github-username]/and_or/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
