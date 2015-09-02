require 'sinatra'

post '/'  do
	p params
end

get '/' do
	"Get is OK"
end
