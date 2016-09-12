# app.rb
require 'sinatra'

class HelloWorldApp < Sinatra::Base
  get '/' do
    headers = env.select {|k,v| k.start_with? 'HTTP_'}
      .collect {|key, val| [key.sub(/^HTTP_/, ''), val]}
      .collect {|key, val| "#{key}: #{val}<br>"}
      .sort
    [200, {'Content-Type' => 'text/html'}, headers]

  end
end
