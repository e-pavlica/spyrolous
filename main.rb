require 'sinatra'
require 'haml'
# require 'less'


configure do
  set :haml, :format => :html5
end

# Basic page routing
get "/" do
  haml :index
end

