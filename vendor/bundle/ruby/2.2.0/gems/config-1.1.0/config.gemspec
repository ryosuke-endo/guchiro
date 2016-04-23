$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'config/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name             = "config"
  s.version          = Config::VERSION
  s.date             = Time.now.strftime '%F'
  s.authors          = ["Jacques Crocker", "Fred Wu", "Piotr Kuczynski"]
  s.email            = ["railsjedi@gmail.com", "ifredwu@gmail.com", "piotr.kuczynski@gmail.com"]
  s.summary          = "Effortless multi-environment settings in Rails, Sinatra, Pandrino and others"
  s.description      = "Easiest way to manage multi-environment settings in any ruby project or framework: Rails, Sinatra, Pandrino and others"
  s.homepage         = "https://github.com/railsconfig/config"
  s.license          = "MIT"
  s.extra_rdoc_files = ["README.md", "CHANGELOG.md", "LICENSE.md"]
  s.rdoc_options     = ["--charset=UTF-8"]

  s.files = `git ls-files`.split($/)
  s.files.select! { |file| /(^lib\/|\.md$|\.gemspec$)/ =~ file }
  s.files += Dir.glob("doc/**/*")

  s.require_paths         = ["lib"]
  s.required_ruby_version = ">= 2.2.2"

  s.add_dependency "activesupport",           ">= 3.0"
  s.add_dependency "deep_merge",              "~> 1.0.1"

  s.add_development_dependency "bundler",     "~> 1.11.2"
  s.add_development_dependency "rake"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "pry"

  # Testing
  s.add_development_dependency "appraisal",   "~> 2.1.0"
  s.add_development_dependency "rails",       "~> 4.2.6"
  s.add_development_dependency "rspec",       "~> 3.4.0"
  s.add_development_dependency "rspec-rails", "~> 3.4.2"
  s.add_development_dependency "test-unit",   "~> 3.1.7"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rubocop"

  if ENV['TRAVIS']
    s.add_development_dependency "codeclimate-test-reporter"
  end
end
