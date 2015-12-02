require File.expand_path "../lib/json_wrapper/version.rb", __FILE__

Gem::Specification.new do |s|
  s.name        = 'json_wrapper'
  s.version     = JsonWrapper::VERSION
  s.date        = '2015-12-02'
  s.summary     = "SwiftyJSON inspired JSON lib for Ruby."
  s.description = "SwiftyJSON inspired JSON lib for Ruby, very handy for JSON access while incoming JSON structure is not definite."
  s.authors     = ["Ryan Guo"]
  s.email       = 'ryan@islandzero.net'
  s.files       = Dir["lib/**/*.rb"]
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-core"
  s.homepage    = 'http://rubygems.org/gems/json_wrapper'
  s.license     = 'MIT'
end
