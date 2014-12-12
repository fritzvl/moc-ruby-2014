require 'json'


RESPONSE = '{ "person": { "name": "Test User", "email": "testuser@example.com"} }'

response = JSON.parse(RESPONSE)


if response.key?("person")

  p response["person"].keys

  person_object = Struct.new("Person", *response["person"].keys.collect(&:to_sym))

  person=person_object.new(*response["person"].values)

  p person.inspect

  person2 = Struct::Person.new(*response["person"].values)

  p person2.inspect

end
