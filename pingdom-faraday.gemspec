$:.push File.expand_path("lib", __dir__)

require "pingdom/version"

Gem::Specification.new do |s|
  s.name        = "pingdom-faraday"
  s.version     = Pingdom::VERSION
  s.license     = "MIT"
  s.summary     = "Pingdom Ruby Client"
  s.description = "Pingdom Ruby Client"
  s.authors     = ["Andy Brennan", "Jonathan la Cour", "Jason Straughan"]
  s.email       = ["andy@hund.io", "jonathan@hund.io", "jasons@grok-interactive.com"]
  s.homepage    = "https://github.com/hundio/pingdom-faraday"

  s.files = Dir["lib/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "activesupport", "~> 5.0"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "rubocop"
end
