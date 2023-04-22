# frozen_string_literal: true
require './lib/pager_duty/version'

Gem::Specification.new do |spec|
  spec.name = "pager_duty"
  spec.version = PagerDuty::VERSION
  spec.authors = ["Paulo Langer"]
  spec.email = ["paulofabiano@gmail.com"]

  spec.summary = "Simple Ruby client for PagerDuty API"
  spec.description = "Ruby client for PagerDuty API"
  spec.homepage = "https://www.pagerduty.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/paulofabiano/pd-ruby-client"
  spec.metadata["changelog_uri"] = "https://www.github.com/paulofabiano/pd-ruby-client/readme.md"

  spec.files = Dir['lib/**/*.rb']
  # spec.executables = ["pager_duty"]
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "bundler", "2.3.17"
  spec.add_development_dependency "rake", "13.0"
  spec.add_development_dependency "rspec", "3.0"
  spec.add_development_dependency "debug", "1.7.2"

  spec.add_dependency "httparty", "0.21.0"
  spec.add_dependency "thor", "1.2.1"
end
