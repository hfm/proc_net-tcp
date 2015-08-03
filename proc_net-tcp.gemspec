# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proc_net/version'

Gem::Specification.new do |spec|
  spec.name          = "proc_net-tcp"
  spec.version       = ProcNet::VERSION
  spec.authors       = ["Takahiro OKUMURA"]
  spec.email         = ["hfm.garden@gmail.com"]

  spec.summary       = %q{Parser for Linux /proc/net/tcp}
  spec.description   = %q{Parser for Linux /proc/net/tcp}
  spec.homepage      = "https://github.com/tacahilo/proc-net-tcp"
  spec.license       = "http://hfm.mit-license.org/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
end
