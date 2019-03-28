require 'net/http'
require 'date'

r = Random.new

while true do
  uri = URI("https://demosensorapi.herokuapp.com/sensors/flow_rate")
  params = { :since => Date.today.prev_day, :id => 'mypump'}
  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)

  puts res
  puts res.body if res.is_a?(Net::HTTPSuccess)
  puts ''

  sleep(1)
end
