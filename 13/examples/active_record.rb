require 'bundler/setup'
Bundler.require(:default)

require 'elasticsearch/model'


@config = YAML.load_file(File.expand_path("./db/config.yml"))["development"]
ActiveRecord::Base.establish_connection @config


class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end


users=[]
10.times do |i|
  users.push User.create(title: Faker::Name.title, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthday: Faker::Date.between(40.year.ago+rand(250).days, 20.year.ago+rand(250).days))
end


puts users.first.title

@users = User.search(query: { match: { title: users.first.title } }, highlight: { fields: { title: {} }}).records


@users.each do |user|
  puts user.inspect
end