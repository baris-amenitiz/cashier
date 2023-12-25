# frozen_string_literal: true

require_relative "lib/cashier/version"

Gem::Specification.new do |spec|
  spec.name = "cashier"
  spec.version = Cashier::VERSION
  spec.authors = ["Baris"]
  spec.email = ["brscimen@gmail.com"]

  spec.summary = "Cashier app for Amenitiz"
  spec.description = "Homework"
  spec.required_ruby_version = "> 3.1.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
