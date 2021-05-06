require 'dotenv'
require 'telegram/bot'
Dotenv.load
$token = ENV['BOT_NIKY_TELEGRAM_API_KEY']

class Raven
    def initialize
        token = $token
        Telegram::Bot::Client.run(token) do |bot|
            bot.listen do |message|
            case message.text
            when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} 👋 ,I hope you are good, I'm Raven and welcome to Niky Resaurent😋. \nI'm a Bot developped at microverse by Barack Mukelenga😍. \nI'm here to help you pass an order so feel free to tell me what you need to taste today or just type menu if you want to see our menu. 🍔🥗 🥘🍾🍷")
            else bot.api.send_message(chat_id: message.chat.id, text: "😰 I'm sorry, #{message.from.first_name}, I'm not able to undertand that, can you please ask your question differently? ")
            end
        end
      end
    end
end
