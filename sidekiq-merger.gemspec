# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sidekiq/merger/version"

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-merger"
  spec.version       = Sidekiq::Merger::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["dtaniwaki"]
  spec.email         = ["daisuketaniwaki@gmail.com"]

  spec.summary       = "Sidekiq merger plugin"
  spec.description   = "Merge sidekiq jobs."
  spec.homepage      = "https://github.com/dtaniwaki/sidekiq-merger"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = [">= 2.2.2", "< 2.5"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "coveralls"

  spec.add_dependency "sidekiq", ">= 3.4.0"
  spec.add_dependency "concurrent-ruby"
  spec.add_dependency "activesupport", ">= 3.2.0"
end