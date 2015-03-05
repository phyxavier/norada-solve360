# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norada/solve360/version'

Gem::Specification.new do |spec|
  spec.name          = "norada-solve360"
  spec.version       = Norada::Solve360::VERSION
  spec.authors       = ["Bernard Otu"]
  spec.email         = ["phyxavier@gmail.com"]
  spec.summary       = %q{Library for accessing Norada Solve 360 REST API.}
  spec.description   = %q{Library for accessing Norada Solve 360 REST API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("json")
  spec.add_dependency("rest-client")

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
