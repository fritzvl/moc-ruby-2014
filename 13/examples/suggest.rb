require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require 'virtus'
require 'faker'
require 'active_support/time'


class User
  include Virtus.model
  attribute :title, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :birthday, Date
end

require 'elasticsearch/persistence'
repository = Elasticsearch::Persistence::Repository.new

users=[]
10.times do |i|
  u = User.new(title: Faker::Name.title, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthday: Faker::Date.between(40.year.ago+rand(250).days, 20.year.ago+rand(250).days))
  users.push u
  repository.save u
end

sleep(2)

user = users[rand(10)]
search_text = user.first_name[0..4]

puts "Users First name: #{user.first_name}"
puts "Search text is: #{search_text}"

puts repository.client.suggest index: "repository", type: "user", body: {my_suggest: {text: search_text, term: {field: 'first_name', size: 10, suggest_mode: :always}}}



