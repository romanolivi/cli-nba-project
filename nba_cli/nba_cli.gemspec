require_relative 'lib/nba_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "nba_cli"
  spec.version       = NbaCLI::VERSION
  spec.authors       = ["Romano Livi"]
  spec.email         = ["romano_livi@outlook.com"]

  spec.summary       = "NBA Ruby CLI App"
  spec.description   = "Description to be filled later"
  spec.homepage      = "https://github.com/romanolivi/cli-nba-project"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/romanolivi/cli-nba-project"
  spec.metadata["changelog_uri"] = "https://github.com/romanolivi/cli-nba-project"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "nokogiri"

end
