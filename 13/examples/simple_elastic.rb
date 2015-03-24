require 'elasticsearch'
require 'uuid'


class Entity

  attr_accessor :id, :name, :email, :phone

  def initialize(args)

    if args.respond_to?(:[])
      self.id = UUID.new.generate unless args[:id]
      self.name = args[:name]
      self.email = args[:email]
      self.phone = args[:phone]
    end

  end


  def save
    client = Elasticsearch::Client.new log: true
    client.index index: "main", type: self.class.to_s, id: self.id, body: {name: self.name, email: self.email, phone: self.phone}
  end


end

100.times do |i|
  entity = Entity.new({name: "Test#{i}", email: "test#{i}@test.com", phone: "#{i}-111-222-33"})
  entity.save
end
sleep(2)

client = Elasticsearch::Client.new log: true
result = client.search index: 'main', body: {from: 0, size: 10,  query: { filtered: {filter:{ limit: {value: 50} }, query: {fuzzy_like_this: { fields: [:name], like_text: 'Test'}}} }}
puts result.inspect

client.indices.delete index: 'main'