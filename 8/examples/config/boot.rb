require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'

class CustomRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Rack low-level application"]]
  end
end

class RootRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Welcome to root"]]
  end
end


class MyMiddleware
  def initialize(appl)
    @appl = appl
  end

  def call(env)

    start = Time.now
    status, headers, body = @appl.call(env) # call our Rack or Sinatra app
    stop = Time.now

    middleware_addition="<br /><br /><br />Test string added by middleware | Response Time: #{stop-start}"
    headers["Content-Length"]=(body[0].length+middleware_addition.length).to_s

    [status, headers, body<<middleware_addition ]
  end
end



get '/' do
  "Hello World from Sinatra!"
end

get '/time' do
  "Current time is: #{Time.now}"
end