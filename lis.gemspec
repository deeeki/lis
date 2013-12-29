lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lis/version'

Gem::Specification.new do |spec|
  spec.name          = "lis"
  spec.version       = Lis::VERSION
  spec.authors       = ["deeeki"]
  spec.email         = ["deeeki@gmail.com"]
  spec.summary       = %q{A simple plaintext list parser/serializer.}
  spec.description   = %q{This gem can parse/serialize between Ruby hash/array and a plaintext list like Markdown.}
  spec.homepage      = "https://github.com/deeeki/lis"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "terminal-notifier-guard"
end
