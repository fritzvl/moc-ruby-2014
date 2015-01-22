require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'active_support'
require 'active_support/core_ext'
require 'factual'

FACTUAL_KEY = ""
FACTUAL_SECRET = ""

ForecastIO.api_key = ''

Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }

