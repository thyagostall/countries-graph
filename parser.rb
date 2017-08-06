require 'net/http'
require 'json'

names = {}
borders = {}

uri = 'https://restcountries.eu/rest/v2/all'
response = Net::HTTP.get_response(URI.parse(uri))

countries_raw = JSON.parse(response.body)
countries_raw.each do |country| 
  name = country["name"]
  code = country["alpha3Code"]

  names[code] = name
  borders[code] = country["borders"]
end

puts borders

