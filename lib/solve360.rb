require "norada/solve360/version"
require 'rubygems'
require 'json'

Dir["#{File.dirname(__FILE__)}/solve360/*.rb"].each { |source_file| require source_file }
