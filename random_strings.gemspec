# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_strings/version'

Gem::Specification.new do |spec|
  spec.name          = "random_strings"
  spec.version       = RandomStrings::VERSION
  spec.authors       = ["Sameer Siruguri"]
  spec.email         = ["sameers.public@gmail.com"]
  spec.description   = %q{This gem helps you generate random string of various "types" - a random email, a random date, a random Twitter handle, etc. Or just a random string.}
  spec.summary       = %q{Do it like this: RandomString::Generator.new.random_email -> boom, you got y7nnha8@uioop.com! Most of the formats follow the Principle Of Least Surprise. Like, an email won't look like 7*6=42@hitchhiker.galaxy}
  spec.homepage      = "http://sameer.siruguri.net/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'  
end
