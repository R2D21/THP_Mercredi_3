require "bundler"
Bundler.require
# $:.unshift File.expand_path("./../lib", __FILE__)
require 'google-drive'
session = GoogleDrive::Session.from_config("config.json")
