source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'bootstrap-sass', '~> 3.3.6'
gem 'autoprefixer-rails'
gem 'bootswatch-rails'
gem 'jquery-turbolinks'
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x
gem 'pg'
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'devise'
gem 'inherited_resources', '~> 1.7'
gem "paperclip", "~> 5.0.0"
#Je crois vraiment que c'est la dernière : https://github.com/kristianmandrup/masonry-rails/releases
gem 'masonry-rails', '~> 0.2.4'
#gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'

#for captcha
gem "recaptcha", require: "recaptcha/rails"
group :development do
    gem 'certified', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end

## Gemfile for paginate
gem 'will_paginate'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0', group: :development
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby], group: :development

gem 'mocha', group: :test
