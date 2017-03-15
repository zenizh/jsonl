$:.unshift File.expand_path('../lib', __FILE__)

require 'jsonl/version'

Gem::Specification.new do |spec|
  spec.name          = 'jsonl'
  spec.version       = JSONL::VERSION
  spec.authors       = ['kami-zh']
  spec.email         = ['hiroki.zenigami@gmail.com']
  spec.summary       = 'Module for handling JSONL (JSON Lines).'
  spec.description   = 'Module for handling JSONL (JSON Lines).'
  spec.homepage      = 'https://github.com/kami-zh/jsonl'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
