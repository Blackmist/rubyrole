require 'sinatra'

set :server, :thin
set :port, ENV['PORT']
set :bind, ENV['ADDRESS']

get '/' do
	"Hello World!"
end