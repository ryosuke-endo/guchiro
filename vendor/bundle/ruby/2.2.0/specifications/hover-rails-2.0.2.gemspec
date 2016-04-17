# -*- encoding: utf-8 -*-
# stub: hover-rails 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "hover-rails"
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Skander"]
  s.date = "2015-03-24"
  s.description = "Gem for the awesome library Hover.css"
  s.email = ["skander.kc@gmaill.com"]
  s.homepage = "https://github.com/Leyka/hover-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.0"
  s.summary = "Gem for the awesome library Hover.css"

  s.installed_by_version = "2.5.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.2"])
    else
      s.add_dependency(%q<railties>, [">= 3.2"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.2"])
  end
end
