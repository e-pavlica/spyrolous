source 'https://rubygems.org'

#define ruby for heroku deployment
ruby "2.0.0"

#require Sinatra as the web server
gem 'sinatra'

#HAML makes life easier
gem 'haml'

# #Trying out LESS for this project (the ruby racer is required for LESS)
# gem 'less'
# gem 'therubyracer'

#try out coffee script -- it seems like a good idea (maybe)
gem 'coffee-script'

# Setup postgres w/ activerecord
gem "pg"
gem "activerecord"
gem "sinatra-activerecord"


#add rspec & factory_girl for testing.
group :development, :test do
  gem 'rspec'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl'
end

group :test do
  gem 'guard-rspec'
end

#Passenger is a great web server for deployment
group :production do
  gem 'passenger'
end
