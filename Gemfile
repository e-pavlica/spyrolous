source 'https://rubygems.org'

#define ruby for heroku deployment
ruby "2.0.0"

#require Sinatra as the web server
gem 'sinatra'

#HAML makes life easier
gem 'haml'

#Passenger is a great web server for deployment
gem 'passenger'

##I'll need a database... the gem for that should go here.


#try out coffee script -- it seems like a good idea (maybe)
gem 'coffee-script'

#add rspec & factory_girl for testing.
group :development, :test do
  gem 'rspec'
  gem 'factory_girl'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
end