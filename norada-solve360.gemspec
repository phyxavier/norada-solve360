# -*- encoding: utf-8 -*-
require File.expand_path('../lib/norada_solve_360/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bernard Otu"]
  gem.email         = ["phyxavier@gmail.com"]
  gem.description   = %q{Library for accessing Norada Solve 360 REST API.}
  gem.summary       = %q{Library for accessing Norada Solve 360 REST API.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "norada_solve_360"
  gem.require_paths = ["lib"]
  gem.version       = NoradaSolve360::VERSION
  gem.add_dependency("json")
  gem.add_dependency("rest-client")
  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 12.3"
end
