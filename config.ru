require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/rocketio'
require File.join(File.dirname(__FILE__), 'lib/lightbox.rb')

set :cometio, :timeout => 120, :post_interval => 2, :allow_crossdomain => true
set :websocketio, :port => (ENV['WS_PORT'] || 9000).to_i
set :rocketio, :comet => true, :websocket => true

EM.set_descriptor_table_size 10000

run Lightbox
