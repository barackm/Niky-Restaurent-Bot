require 'telegram/bot'

class Raven
    attr_reader :greeting, :token
    def initialize(token, greeting)
        @greeting = greeting
        @token = token
        Telegram::Bot::Client.run(@token) do |bot|
            bot.listen do |message|
            received_message = message.text.downcase.gsub(/[^A-Za-z0-9\s]/i, '')
            case 
                
            when start(received_message)
               send_message(bot, message, "Hello #{message.from.first_name} 👋 ,I hope you are good, I'm Raven and welcome to Niky Resaurent😋. \nI'm a Bot🤖 developped at microverse by Barack Mukelenga😍. \nI'm here to help you pass an order so feel free to tell me what you need to taste today or just type menu if you want to see our menu. 🍔🥗 🥘🍾🍷")

            when @greeting.get_my_creator(received_message)
                send_message(bot, message, "I was created with ❤️ by Barack Mukelenga in 2021 while he was studying sofware development at microverse.\nIf you want to know more about him here are some usefull links:\n- https://github.com/barackm/ \n- https://twitter.com/BarackMukelenga \n- https://www.linkedin.com/in/baraka-mukelenga/")

            when @greeting.check_rejection(received_message)
                send_message(bot, message, "Oh sure? okay no problem #{message.from.first_name}, if there is something I can help with just let me know.")

            when @greeting.check_greetings(received_message)
                send_message(bot, message, "Hi #{message.from.first_name} welcome to our restaurent\nHow are you doing today ?")
            
            when @greeting.receive_greetings(received_message)
                send_message(bot, message, "I am very well thank you, what about you?")

            when @greeting.ask_for_name(received_message)
                send_message(bot, message, "My name is Raven, what is your name? please answer like: my name is... then your name")
            
            when @greeting.check_greetings_answer(received_message)
                send_message(bot, message, "I'm very well thanks, what new dish would you like to taste today from our best recipes?")
           
            when @greeting.check_bad_news(received_message)
                send_message(bot, message, "Oh sorry to hear that #{message.from.first_name}, I am here if you need help.")


            when @greeting.got_name(received_message)
                send_message(bot, message, "Nice to meet you #{message.from.first_name}, what new dish would you like to taste today from our best recipes?")
           
            when @greeting.check_affirmation(received_message)
                send_message(bot, message, "Great, let me know if I can help.")

            else 
                send_message(bot, message,"😰 I'm sorry, #{message.from.first_name}, I'm not able to undertand that, can you please ask your question differently? ")
            end
        end
      end
    end

    def start(input)
        if input.include? '/start'
            return true
        end
        false
    end
    def send_message(bot, message, text)
        bot.api.send_message(chat_id: message.chat.id, text: text)
    end
end
