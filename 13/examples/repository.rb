require 'virtus'


class Article
  include Virtus.model
  attribute :title, String
end

require 'elasticsearch/persistence'
repository = Elasticsearch::Persistence::Repository.new

repository.save Article.new(title: "Test#{rand(100)}")

result = repository.search query: {fuzzy_like_this: { fields: [:title], like_text: 'Test'}}, size: 10

puts result.response.inspect