require_relative 'lib/nanuk/version'

Gem::Specification.new do |spec|
  spec.name          = "nanuk"
  spec.version       = Nanuk::VERSION
  spec.authors       = ["patztablook22"]
  spec.email         = ["patz@tuta.io"]

  spec.summary       = "Nanuk API for Ruby"
  spec.description   = "FFI wrapper for Nanuk, a deep learning library written in C++"
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    # `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  spec.files         = Dir["**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/extconf.rb"]
  
  # dependencies
  spec.add_runtime_dependency 'ffi', '>= 1.13'
end
