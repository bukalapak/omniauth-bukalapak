# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/bukalapak/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-bukalapak"
  spec.version       = OmniAuth::Bukalapak::VERSION
  spec.authors       = ["Alif Rachmawadi"]
  spec.email         = ["subosito@bukalapak.com"]
  spec.summary       = %q{Official OmniAuth strategy for Bukalapak}
  spec.description   = %q{Official OmniAuth strategy for Bukalapak}
  spec.homepage      = "https://github.com/bukalapak/omniauth-bukalapak"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'simplecov'
end
