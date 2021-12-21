# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sarvevents/version"

Gem::Specification.new do |spec|
  spec.name          = "sarvevents"
  spec.version       = SARVEvents::VERSION
  spec.authors       = ["Blindside Networks"]
  spec.email         = ["ffdixon@blindsidenetworks.com"]

  spec.summary       = %q{Easily parse data from a sarvwave recording's events.xml.}
  spec.description   = %q{Ruby gem for easily parse data from a sarvwave recording's events.xml.}
  spec.homepage      = "https://www.blindsidenetworks.com"
  spec.license       = "LGPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.4"

  # Gem dependecies.
  spec.add_dependency 'activesupport', '>= 5.0.0.1', '< 7'
  spec.add_dependency 'rexml' # Required for activesupport from_xml

end
