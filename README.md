# AccessibleHash

Adds ability to access hash elements with custom method calls.

## Installation

Add this line to your application's Gemfile:

    gem 'accessible_hash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install accessible_hash

## Usage

Call the make_accessible method either on the Hash class:

  Hash.make_accessible

or on a hash object

  a = {}
  a.make_accessible

to gain access to data members by methods who's names correspond to the keys.
For example:

  a.foo = "bar"

is equivalent to

  a[:foo] = "bar"

Similarly,

  a.foo

is equivalent to

  a[:foo]

Using the class level method adds this functionality to all Hashes, whereas using the instance method adds the functionality only to the hash it is called on.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
