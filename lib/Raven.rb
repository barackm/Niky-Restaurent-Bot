require 'telegram/bot'

class Raven
    attr_reader :greeting, :token, :order, :suggestions, :suggest_food, :suggest_drinks
    def initialize(token, greeting, order, suggestions)
        @greeting = greeting
        @token = token
        @order = order
        @suggestions = suggestions
        @suggest_food = false
        @suggest_drinks = false

        Telegram::Bot::Client.run(@token) do |bot|
            bot.listen do |message|
            received_message = message.text.downcase.gsub(/[^A-Za-z0-9\s]/i, '')
            case 
                
            when start(received_message)
               send_message(bot, message, "Hello #{message.from.first_name} 👋 ,I hope you are good, I'm Raven and welcome to Niky Resaurent😋. \nI'm a Bot🤖 developped at microverse by Barack Mukelenga😍. \nI'm here to help you pass an order so feel free to tell me what you need to taste today or just type 👉 menu if you want to see our menu. 🍔🥗 🥘🍾🍷\n\n✅ Here are some keywords you can use to find quickly what you need:\n✔️ menu: to visit our menu\n✔️ suggest: to have my suggestion on what you can order\n✔️ food or eat: if you are hungry\n\nIf you need to know more about my creator you can just type 👉  creator, or as any questions regarding to that. Thank you!")

            when @greeting.get_my_creator(received_message)
                send_message(bot, message, "I was created with ❤️ by Barack Mukelenga in 2021 while he was studying sofware development at microverse.\nIf you want to know more about him here are some usefull links:\n- https://github.com/barackm/ \n- https://twitter.com/BarackMukelenga \n- https://www.linkedin.com/in/baraka-mukelenga/")
            
            when @suggestions.food_drinks_suggestion_accepted(received_message)
                if(@suggest_food)
                    send_message(bot, message, "Okay wondefull, you will be served in few minutes. Thanks for your patience.")
                elsif(@suggest_drinks)
                    send_message(bot, message, "Okay wondefull, you will be served in few minutes. Thanks for your patience.")
                end

            when @greeting.check_rejection(received_message)
                if(@suggest_food)
                    send_message(bot, message, "Oh sure? okay no problem #{message.from.first_name},to your thirst 😋.")
                    @suggest_food = false
                elsif(@suggest_drinks)
                    send_message(bot, message, "Oh sure? okay no problem #{message.from.first_name}, Injoy your meal 😋.")
                    @suggest_drinks = false
                else
                    send_message(bot, message, "Oh sure? okay no problem #{message.from.first_name}, if there is something I can help with just let me know.")
                end

            when @order.get_food_order(received_message)
                @suggest_drinks = true
                @suggest_food = false
                choice = message.text
                send_message(bot, message, "Great choice! What about wine? Would you like some red wine with your #{choice}?")

            when @order.get_drinks_order(received_message)
                @suggest_food = true
                @suggest_drinks = false
                choice = message.text
                send_message(bot, message, "Wow, Great choice! What about food? Would you like a Chicken with your #{choice}?")

            when @greeting.check_greetings(received_message)
                send_message(bot, message, "Hi #{message.from.first_name} welcome to our restaurent\nHow are you doing today ?")
            
            when @greeting.receive_greetings(received_message)
                send_message(bot, message, "I am very well thank you, what about you?")

            when @greeting.receive_compliments(received_message)
                send_message(bot, message, "Oh thank you #{message.from.first_name} for your compliments, I like you too and I am here to help, don't hesitate to tell me whenever you need help ❤️❤️")

            when @order.say_thank_you(received_message)
                send_message(bot, message, "It's my pleasure.")

            when @greeting.ask_for_name(received_message)
                send_message(bot, message, "My name is Raven, what is your name? please answer like: my name is... then your name")
            
            when @greeting.check_greetings_answer(received_message)
                send_message(bot, message, "I'm very well thanks, what new dish would you like to taste today from our best recipes?")
           
            when @greeting.check_bad_news(received_message)
                send_message(bot, message, "Oh sorry to hear that #{message.from.first_name}, I am here if you need help.")

            when @order.menu_asked(received_message)
                send_message(bot, message, "❤️❤️ NIKY RESTAURENT ❤️❤️\n\nFOOD🍔\n✔️ Cheeseburger 🍔\n✔️ Chicken 🍖\n✔️ Reuben sandwich\n✔️ Hot dog 🌭\n✔️ Nachos\n✔️ Cobb Salad 🥗\n✔️ Twinkies\n✔️ Jambalaya\n✔️ Macaronni and chees\n✔️ chips 🍟\n✔️ Cioppino\n✔️ Baked beans\n\nDRINKS🍷\n✔️ Water\n✔️ Coors Light\n✔️ Coffee\n✔️ Miller Lite\n✔️ Budweiser\n✔️ Modelo Espacial\n✔️ Bud light\n✔️ Vodka\n\n\nI hope you have found what were looking for.\n\n✅ If yes just type the exact name of your choice.\n\n✅ If no, sorry... But is you need a suggestion from me just type 👉 suggest.")

            when @greeting.say_bye(received_message)
                send_message(bot, message, "Okay bye #{message.from.first_name}, see you later.👋")

            when @order.order_asked(received_message)
                send_message(bot, message, "Great, we have amazing dishes and wines, you will love it I swear Humm😋😋😋 🍖 🍷. If you want to see our menu just type 👉 menu. If you want my suggestion just type 👉 suggest")

            when @greeting.got_name(received_message)
                send_message(bot, message, "Nice to meet you #{message.from.first_name}, what new dish would you like to taste today from our best recipes?")
           
            when @greeting.check_affirmation(received_message)
                send_message(bot, message, "Great, let me know if I can help.")

            when @suggestions.suggest_order(received_message)
                send_message(bot, message, "Wonderfull, I would suggest you to take Reuben sandwich with a bit of Hot dog 🌭, then a Vodka 😋😋😋.\n\n✅ If you don't like my suggestion then you can try to visit our menu again hopefully you will find something great😋 by just typing 👉 menu.")

            else 
                send_message(bot, message,"😰 I'm sorry, #{message.from.first_name}, I'm not able to undertand that, can you please ask your question differently? ")
            end
        end
      end
    end

    def start(input)
        if input.include? 'start'
            return true
        end
        false
    end
    def send_message(bot, message, text)
        bot.api.send_message(chat_id: message.chat.id, text: text)
    end
end
