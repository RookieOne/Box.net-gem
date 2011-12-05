# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "boxnet/version"

Gem::Specification.new do |s|
  s.name        = "boxnet"
  s.version     = BoxnetApi::VERSION
  s.authors     = ["Jonathan Birkholz"]
  s.email       = ["rookieone@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby gem for Box.net REST Api}
  s.description = %q{Ruby gem for Box.net REST Api}

  s.rubyforge_project = "boxnet"

  s.add_development_dependency "rspec"
  s.add_development_dependency "httparty"
  s.add_development_dependency "json"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
