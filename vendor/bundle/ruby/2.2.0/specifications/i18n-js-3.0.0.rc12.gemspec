# -*- encoding: utf-8 -*-
# stub: i18n-js 3.0.0.rc12 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n-js"
  s.version = "3.0.0.rc12"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nando Vieira"]
  s.date = "2015-12-30"
  s.description = "It's a small library to provide the Rails I18n translations on the Javascript."
  s.email = ["fnando.vieira@gmail.com"]
  s.homepage = "http://rubygems.org/gems/i18n-js"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.0"
  s.summary = "It's a small library to provide the Rails I18n translations on the Javascript."

  s.installed_by_version = "2.5.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, [">= 0.6.6", "~> 0.6"])
      s.add_development_dependency(%q<appraisal>, ["~> 2.0"])
      s.add_development_dependency(%q<activesupport>, [">= 3.2.22"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<gem-release>, [">= 0.7"])
    else
      s.add_dependency(%q<i18n>, [">= 0.6.6", "~> 0.6"])
      s.add_dependency(%q<appraisal>, ["~> 2.0"])
      s.add_dependency(%q<activesupport>, [">= 3.2.22"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<gem-release>, [">= 0.7"])
    end
  else
    s.add_dependency(%q<i18n>, [">= 0.6.6", "~> 0.6"])
    s.add_dependency(%q<appraisal>, ["~> 2.0"])
    s.add_dependency(%q<activesupport>, [">= 3.2.22"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<gem-release>, [">= 0.7"])
  end
end
