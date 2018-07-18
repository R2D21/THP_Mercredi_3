require "bundler"
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'google_drive'
require "scrapper"
require "url"
require "email"

# session = GoogleDrive::Session.from_config("config.json")
# ws = session.spreadsheet_by_key("1oe3-ps6UiH55_Wvb0WEG5XJ6-zDbtz2YB-egLiZITEM").worksheets[0]
# p ws[22,1] = "Salut tout le monde"
# ws.save
scrapper = Scrapper.new("http://annuaire-des-mairies.com/val-d-oise.html")
