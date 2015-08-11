Gem::Specification.new do |s|
  s.name = "pingdom-faraday"
  s.version = "0.0.1"

  s.authors = ["Andy Brennan", "Jason Straughan"]
  s.date = "2015-08-11"
  s.description = "Pingdom Ruby Client"
  s.email = ["andyvaldez75@gmail.com", "jasons@grok-interactive.com"]
  s.files = [
    "pingdom-faraday.gemspec",
    "Gemfile",
    "Gemfile.lock",
    "lib/pingdom/base.rb",
    "lib/pingdom/check.rb",
    "lib/pingdom/client.rb",
    "lib/pingdom/contact.rb",
    "lib/pingdom/probe.rb",
    "lib/pingdom/result.rb",
    "lib/pingdom/summary/average.rb",
    "lib/pingdom/summary/outage.rb",
    "lib/pingdom/summary/performance.rb",
    "lib/pingdom/summary.rb",
    "lib/pingdom-faraday.rb",
    "lib/pingdom.rb",
    "lib/tinder/faraday_response.rb",
    "Rakefile",
    "Readme.md",
    "spec/pingdom-faraday_spec.rb",
    "spec/spec_helper.rb",
  ]
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "activesupport", "~> 4.2.3"
  s.add_development_dependency "rspec", "~> 3.3.0"
  s.add_development_dependency "rubocop"
  s.summary = "Pingdom Ruby Client"
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/pingdom-faraday_spec.rb",
  ]
end
