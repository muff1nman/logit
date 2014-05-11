# Logit

Logit is purposed to be a simple extension to the usual logging tool in ruby.
Mainly, the two goals are:

1. Easy to use
2. Colorful

## Installation

Add this line to your application's Gemfile:

    gem 'logit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logit

## Usage

```ruby
require 'logit'

module YourModuleOrClass
	extend Logit

	def some_method
		logger.debug "The sky is falling!"
	end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/logit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
