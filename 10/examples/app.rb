require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require 'sinatra/base'
require 'sinatra/contrib/all'
require 'sinatra/reloader'
require 'padrino-helpers'
require 'kaminari'

::Kaminari::Hooks.init
register Kaminari::Helpers::SinatraHelpers
register Padrino::Helpers

#set :environment, :production
enable :sessions
enable :logging
enable :protect_from_csrf

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

get "/" do
  redirect to("/services")
end

get "/services" do
  page = 1
  page = params[:page] if params[:page]

  subjects = Service.all.page(page)
  erb :index, locals: {subjects: subjects, page: page}, layout: "layout"
end


get "/services/new" do
  subject = Service.new
  erb :new, locals: {subject: subject}, layout: "layout"
end

get "/services/:id/edit" do |id|
  subject = Service.find(id)
  erb :edit, locals: {subject: subject}, layout: "layout"
end


post "/services" do
  subject = Service.new(params[:service])

  if subject.save
    redirect to("/services/#{subject.id}")
  else
    erb :new, locals: {subject: subject}, layout: "layout"
  end
end

put "/services/:id" do |id|

  subject = Service.find(id)
  subject.update_attributes(params[:service])
  if subject.save
    redirect to("/services/#{subject.id}")
  else
    erb :edit, locals: {subject: subject}, layout: "layout"
  end


end

delete "/services/:id" do |id|
  subject = Service.find(id)
  subject.destroy
  redirect to("/services")
end


get "/services/:id" do |id|

  subject = Service.find(id.to_i)
  erb :show, locals: {subject: subject}, layout: "layout"
end

get "/services/:id/visits" do |id|
  page = 1
  page = params[:page] if params[:page]

  label = Service.select("label").find(id.to_i).label
  visits = Visit.for_service(id).page(page)

  erb :visits, locals: {label: label, visits: visits}, layout: "layout"
end


