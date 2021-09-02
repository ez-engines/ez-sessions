# frozen_string_literal: true

require_relative 'lib/ez/sessions/version'

Gem::Specification.new do |spec|
  spec.name        = 'ez-sessions'
  spec.version     = Ez::Sessions::VERSION
  spec.authors     = ['Volodya Sveredyuk']
  spec.email       = ['sveredyuk@gmail.com']
  spec.homepage    = 'https://github.com/ez-engines/ez-sessions'
  spec.summary     = 'Easy database persisted sessions for Rails'
  spec.description = 'Easy database persisted sessions for Rails'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ez-engines/ez-sessions'
  spec.metadata['changelog_uri'] = 'https://github.com/ez-engines/ez-sessions/CHANGELOG.md'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'ez-core', '~> 0.2'
  spec.add_dependency 'jwt', '~> 2.2'
  spec.add_dependency 'rails', ' >= 5.2', '<= 7.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry-rails'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
