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

```
andor = AndOr::RegExp.new("test1 test2, test3")
andor.classify
target_content = "This is test1."
andor.check_single(target_content)
andor.check_multi(target_content)
andor.result
```



## Contributing
