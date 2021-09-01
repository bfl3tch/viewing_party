source 'https://rubygems.org'

git_source(:github) do |repo_name|
   repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.2'

gem 'rails', '5.2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt'
gem 'faraday'
gem 'figaro'

group :development, :test do
  gem 'pry'
  gem 'travis'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
  gem 'travis'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
  gem 'orderly'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
