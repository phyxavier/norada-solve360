# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nordara_solve_360/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Invokevoke Inc"]
  gem.email         = ["bernard@invokevoke.com"]
  gem.description   = %q{Library for accessing Norada Solve 360 REST API.}
  gem.summary       = %q{Library for accessing Norada Solve 360 REST API.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nordara_solve_360"
  gem.require_paths = ["lib"]
  gem.version       = NordaraSolve360::VERSION
  gem.add_dependency("json")
  gem.add_dependency("rest-client")
end