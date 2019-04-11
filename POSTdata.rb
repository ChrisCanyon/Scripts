require 'net/http'

r = Random.new
sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure", "motor_power"]

while true do
  for type in sensorTypes do
    uri = URI("https://demosensorapi.herokuapp.com/sensors/" + type)
    res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1 + r.rand(400)/100.0), 'id' => 'mypump')
    puts res
  end
  puts ''

  sleep(2)
end
