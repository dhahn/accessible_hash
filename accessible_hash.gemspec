# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accessible_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "accessible_hash"
  spec.version       = AccessibleHash::VERSION
  spec.authors       = ["JC Wilcox"]
  spec.email         = ["84jwilcox@gmail.com"]
  spec.description   = %q{Adds ability to access hash elements with custom method calls.}
  spec.summary       = %q{Adds attr_accessor-esque methods to hash attributes.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
