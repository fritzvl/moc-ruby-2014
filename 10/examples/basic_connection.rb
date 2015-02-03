require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require 'sinatra'


#set :environment, :production
enable :sessions
enable :logging


case settings.environment
  when development?
    require 'sinatra/reloader'
    require 'better_errors'
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
end

set :sessions, key: 'N&wedhSDF',
    domain: "localhost",
    path: '/',
    expire_after: 14400,
    secret: '*&(^B234'

require "./models"


get "/services/:id" do |id|

  subject = Service.find(id.to_i)
  erb :show, locals: {subject: subject}
end
