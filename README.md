# JSONL

JSONL is just a module for handling [JSONL](http://jsonlines.org) (JSON Lines) parsing with JSON module.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsonl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsonl

## Usage

To parse JSONL text, just pass the source to `JSONL.parse`, which transfers the processing to `JSON.parse`.

`source.jsonl`:

```json
{"name": "Gilbert", "wins": [["straight", "7♣"], ["one pair", "10♥"]]}
{"name": "Alexa", "wins": [["two pair", "4♠"], ["two pair", "9♠"]]}
{"name": "May", "wins": []}
{"name": "Deloise", "wins": [["three of a kind", "5♣"]]}
```

```ruby
require 'jsonl'

source = File.read('source.jsonl')

parsed = JSONL.parse(source)
parsed.class #=> Array
parsed.count #=> 4
parsed[0] #=> {"name"=>"Gilbert", "wins"=>[["straight", "7♣"], ["one pair", "10♥"]]}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kami-zh/jsonl.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
