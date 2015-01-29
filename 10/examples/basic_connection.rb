require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'


@config = YAML.load_file(File.expand_path("./db/config.yml"))[ENV['RAILS_ENV']]
ActiveRecord::Base.establish_connection @config

class Service<ActiveRecord::Base
end

s = Service.new({label: "Google",last_visited_at: Time.now})
s.save