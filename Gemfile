source "https://rubygems.org"

gem "rails", "~> 8.0.2"

gem "bcrypt"
gem "faker"
gem "will_paginate", "3.3.1"
gem "bootstrap-will_paginate"
gem "bootsnap", require: false
gem "bootstrap-sass"
gem "config"
gem "sassc-rails"
gem "importmap-rails"
gem "jbuilder"
gem "kamal", require: false
gem "propshaft"
gem "puma", ">= 5.0"
gem "rubocop", require: false
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "sqlite3", ">= 2.1"
gem "stimulus-rails"
gem "turbo-rails"
gem "thruster", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rails-controller-testing"
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
end

group :production do
  gem "pg"
end
