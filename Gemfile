source "http://rubygems.org"

ruby '2.4.0'
gem 'rack'
gem 'rake'
gem 'thin'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'actionpack'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.20.0'
end