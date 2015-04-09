# application.rb
document   = YAML.load(File.read(File.expand_path('../../app_config.yml', __FILE__)))
APP_CONFIG = document[Rails.env]

