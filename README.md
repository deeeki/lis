# Lis

A simple plaintext list parser/serializer

## Installation

Add this line **with `github` option** to your application's Gemfile:

    gem 'lis', github: 'deeeki/lis'

And then execute:

    $ bundle

## Usage

```ruby
Lis.parse("a\n-b\n--c\n") #=> {"a"=>{"b"=>["c"]}}
Lis.serialize({ "a" => { "b" => ["c"] } }) #=> "a\n-b\n--c\n"
```

### That means

The following plaintext list --

```
Ruby
-2
--2.1.0
--2.0.0
-1
--1.9.3
--1.8.7
Rails
-4
--4.1.0
--4.0.2
-3
--3.2.16
```

will be converted to the following as Ruby hash object.

```ruby
{
  "Ruby" => {
    "2" => ["2.1.0", "2.0.0"],
    "1" => ["1.9.3", "1.8.7"]
  },
  "Rails" => {
    "4" => ["4.1.0", "4.0.2"],
    "3" => ["3.2.16"]
  }
}
```

## Plans

* Support Markdown lists format
 * lists with top-level symbol (`"-a\n--b\n---c\n"`)
 * other symbols (`*` and `+`)

## Supported versions

* Ruby 2.1.0 or higher

## Contributing

1. Fork it ( http://github.com/deeeki/lis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
