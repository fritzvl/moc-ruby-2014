require 'bundler/setup'
Bundler.require(:default)
require 'elasticsearch/persistence/model'


class Article
  include Elasticsearch::Persistence::Model
  attribute :title, String, mapping: { analyzer: 'snowball' }
end

Article.create title: 'Test'