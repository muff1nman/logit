# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logit.rb'

Gem::Specification.new do |spec|
  spec.name          = "logit"
  spec.version       = Logit::VERSION
  spec.authors       = ["Andrew DeMaria"]
  spec.email         = ["lostonamountain@gmail.com"]
  spec.summary       = %q{A colorful logging extension}
  spec.homepage      = "https://github.com/muff1nman/logit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
