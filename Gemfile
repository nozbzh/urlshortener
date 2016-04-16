source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '5.0.0.beta3'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'redis'

gem 'slim'
gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'autoprefixer-rails'
gem "google_custom_search_api"

group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'quiet_assets'

  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end
