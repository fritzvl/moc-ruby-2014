Fabricator(:service) do
    label {Faker::Internet.domain_name}
    last_visited_at {Faker::Date.between(2.days.ago, Date.today)}
    counter {rand(10)}
    visits(count: 10)
end