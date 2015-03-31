json.array!(@articles) do |article|
  json.extract! article, :id
  json.url article_url(article, format: :json)
end
