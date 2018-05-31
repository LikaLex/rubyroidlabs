require './main'
require_relative 'scraper'
require_relative 'translator'


parse = Scraper.new
parse.information
bot = TelegramBot.new(TOKEN)
bot.start