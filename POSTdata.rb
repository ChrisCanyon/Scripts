require 'net/http'

r = Random.new

while true do
  uri = URI("https://demosensorapi.herokuapp.com/sensors/flow_rate")
  res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => r.rand(500)/100.0, 'id' => 'mypump')

  puts res
  puts ''

  sleep(1)
end
