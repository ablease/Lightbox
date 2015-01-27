require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'lib/lightbox.rb')
require File.join(File.dirname(__FILE__), 'middleware/chat_backend')

use Chat::Sockets

run Lightbox