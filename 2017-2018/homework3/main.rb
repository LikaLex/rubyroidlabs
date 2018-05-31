require 'telegram/bot'
require 'dotenv/load'
require_relative 'scraper.rb'

TOKEN = ENV['MyTOKEN']
class TelegramBot

def initialize(token)
  @token = token
  @actors = {}
end


def search_actor(bot, message)
  translator =  Translate.new.translate(message.text.upcase).to_s
  actor = message.text.upcase.to_s
  if @actors.key?(translator) || @actors.key?(actor)
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "#{translator}:\n-#{@actors[translator]}"
    )
  elsif !@actors.key?(message.text.upcase.to_s)
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Don't know. Please, try another person."
    )
  end
end

def start
@actors = JSON.parse(File.read('list.json'))

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(
              chat_id: message.chat.id,
            text: "Hello, #{message.from.first_name}.
\n I'll tell you about the famous cum-outs.
\n Enter the name and surname of the actor(actress).")
        when '/stop'
          bot.api.send_message(
              chat_id: message.chat.id,
            text: "Bye, #{message.from.first_name}")

        when message.text
          search_actor(bot, message)

        end
        end
    end
end
end