# AndOr

Simple String Search Engine.

## Installation

Add this line to your application's Gemfile:

    gem 'and_or'

## Usage

The arguments is string or array.

[A B, C] => (A and B) or C  
[A B, C D, E] => (A adn B) or (C and D) or E  

```ruby
andor = AndOr::RegExp.new("test1, test3")
andor.classify
target_content = "This is test1."
andor.check_single(target_content)
andor.check_multi(target_content)
andor.result # -> true
```

```ruby
andor = AndOr::RegExp.new("test1 test2, test3")
andor.classify
target_content = "This is test1."
andor.check_single(target_content)
andor.check_multi(target_content)
andor.result # -> false
```

## Author
Hiroaki Egusa

