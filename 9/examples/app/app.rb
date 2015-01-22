get '/' do
  current_point = IpAPI.geolocate(request.ip)
  unless current_point.nil?
    forecast = ForecastIO.forecast(current_point["lat"], current_point["lon"], time: Time.now.tomorrow.to_i, params: {units: 'si'})
    {location: current_point["city"], current: forecast["currently"], tomorrow: forecast["daily"], error: ""}.to_json
  else
    status 404
    {error: "Not found"}.to_json
  end
end


get '/:city_name' do |city_name|
  factual = Factual.new(FACTUAL_KEY, FACTUAL_SECRET)
  city = factual.table("world-geographies").search(city_name).rows.first
  unless city.nil?
    forecast = ForecastIO.forecast(city["latitude"], city["longitude"], time: Time.now.tomorrow.to_i, params: {units: 'si'})
    {location: city_name, current: forecast["currently"], tomorrow: forecast["daily"], error: ""}.to_json
  else
    status 404
    {error: "Not found"}.to_json
  end
end