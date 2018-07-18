require "bundler"
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'google_drive'
session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_key("1smypkyAz4STrKO4Zkos5Z4UPUJKvvgIza32LnlQ7OGw").worksheets[0]
