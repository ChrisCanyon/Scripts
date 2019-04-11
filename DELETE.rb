require 'net/http'
require 'date'

sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure"]

for type in sensorTypes do
  uri = URI("https://demosensorapi.herokuapp.com/sensors/" + type)
  params = { :since => Date.today.prev_day, :id => 'mypump'}
  uri.query = URI.encode_www_form(params)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  req = Net::HTTP::Delete.new(uri.path + "?" + uri.query)
  res = http.request(req)

  puts res
end

return
