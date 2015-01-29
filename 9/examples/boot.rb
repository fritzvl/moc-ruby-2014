require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'active_support'
require 'active_support/core_ext'
require 'factual'

FACTUAL_KEY = "qiyjcc8fa3NSj9qSiZABYgtV0dYWBGXo1lzynF28"
FACTUAL_SECRET = "JoIGqN5wBzXOmw4keBffhUFCJhEJPncIeZvz0m4k"

ForecastIO.api_key = '5e101cddedae5786adcffaf255a5ee6e'

Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }

