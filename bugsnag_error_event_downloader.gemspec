# frozen_string_literal: true

require_relative "lib/bugsnag_error_event_downloader/version"

Gem::Specification.new do |spec|
  spec.name = "bugsnag_error_event_downloader"
  spec.version = BugsnagErrorEventDownloader::VERSION
  spec.authors = ["masakiq"]
  spec.email = ["<>"]

  spec.summary = "Download bugsnag error events"
  spec.description = <<~HERE
    This gem allows developers to programmatically downloads bugsnag error events via command line.
  HERE
  spec.homepage = "https://github.com/masakiq/bugsnag_error_event_downloader"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/masakiq/bugsnag_error_event_downloader"
  spec.metadata["changelog_uri"] = "https://github.com/masakiq/bugsnag_error_event_downloader/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency("bugsnag-api")
  spec.add_runtime_dependency("csv")
  spec.add_runtime_dependency("json")
  spec.add_runtime_dependency("jsonpath")
  spec.add_runtime_dependency("sorbet-runtime")
  spec.add_runtime_dependency("thor")

  spec.add_development_dependency("pry")
  spec.add_development_dependency("pry-byebug")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("rspec-sorbet")
  spec.add_development_dependency("rubocop")
  spec.add_development_dependency("rubocop-shopify")
  spec.add_development_dependency("simplecov")
  spec.add_development_dependency("sorbet")
  spec.add_development_dependency("tapioca")

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
