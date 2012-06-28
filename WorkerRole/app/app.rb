require 'sinatra'
require 'dalli'

set :server, :thin
set :port, ENV['PORT']
set :bind, ENV['ADDRESS']

dc = Dalli::Client.new('localhost_WorkerRole:11211')
dc.set('message', 'Hello World!')

get '/' do
	dc.get('message')
end