require 'sinatra'
require 'net/http'

$stdout.sync = true


get '/webhook/staging' do
    uri = URI.parse "https://everydayhero-staging.com/integrations/strava/webhooks/"
    uri.query = "hub.challenge=" + params["hub.challenge"]

    content_type 'application/json', :charset => 'utf-8'

    Net::HTTP.get(uri)
end

post '/webhook/staging' do
  uri = URI.parse "https://everydayhero-staging.com/integrations/strava/webhooks/"

  http = Net::HTTP.new(uri.host, uri.port)
  r = Net::HTTP::Post.new(uri.request_uri)
  b = request.body.read
  puts b.inspect
  puts request.inspect
  r.body = b
  r["Content-Type"] = "application/json"

  http.request(r)
  status 202
end

get '/webhook/production' do
    uri = URI.parse "https://everydayhero.com/integrations/strava/webhooks/"
    uri.query = "hub.challenge=" + params["hub.challenge"]

    content_type 'application/json', :charset => 'utf-8'

    Net::HTTP.get(uri)
end

post '/webhook/production' do
  uri = URI.parse "https://everydayhero.com/integrations/strava/webhooks/"

  http = Net::HTTP.new(uri.host, uri.port)
  r = Net::HTTP::Post.new(uri.request_uri)
  b = request.body.read
  puts b.inspect
  puts request.inspect
  r.body = b
  r["Content-Type"] = "application/json"

  http.request(r)
  status 202
end
