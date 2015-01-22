class IpAPI

  IPAPI_URL = "http://ip-api.com/json#"

  def self.geolocate(ip)
    result = JSON.parse(RestClient.get("#{IPAPI_URL}#{ip}"))
    result.has_key?("lat") ? result : nil
  end
end