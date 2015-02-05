Fabricator(:service) do
    label {Faker::Internet.domain_name}
    last_visited_at {Faker::Date.between(2.days.ago, Date.today)}
    counter {rand(10)}
    visits(rand: 50) {Fabricate(:visit)}
end