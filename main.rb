require "base64"
require "excon"
require "json"

def main
  consumer_key    = ENV["CONSUMER_KEY"] || abort("need CONSUMER_KEY")
  consumer_secret = ENV["CONSUMER_SECRET"] || abort("need CONSUMER_SECRET")

  client = Excon.new("https://api.twitter.com")

  credentials = Base64.urlsafe_encode64("#{consumer_key}:#{consumer_secret}")

  resp = client.post(
    path: "/oauth2/token",
    expect: 200,
    headers: {
      "Authorization" => "Basic #{credentials}",
      "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8",
    },
    body: URI.encode_www_form(
      "grant_type" => "client_credentials",
    )
  )

  data = JSON.parse(resp.body)

  puts "Success!"
  puts "access_token = #{data["access_token"]}"
end

main
