# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
# rubocop:disable Lint/DuplicateBranch

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

    start_raven
  end

  def start_raven # rubocop:disable Metrics/PerceivedComplexity
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        received_message = message.text.downcase.gsub(/[^A-Za-z0-9\s]/i, '')
        puts message.text
        if start(received_message)
          send_message(bot, message,
                       "Hello #{message.from.first_name} 👋 ,I hope you are good, I'm Raven and welcome to Niky Restaurant😋. \nI'm a Bot🤖 developped at microverse by Barack Mukelenga😍. \nI'm here to help you pass an order so feel free to tell me what you need to taste today or just type 👉 menu if you want to see our menu. 🍔🥗 🥘🍾🍷\n\n✅ Here are some keywords you can use to find quickly what you need:\n✔️ menu: to visit our menu\n✔️ suggest: to have my suggestion on what you can order\n✔️ help: if you need any help from me.\n✔️ food or eat: if you are hungry\n\nIf you need to know more about my creator you can just type 👉  creator, or ask any questions regarding that. Thank you!")

        elsif @greeting.get_my_creator(received_message)
          send_message(bot, message,
                       "I was created with ❤️ by Barack Mukelenga in 2021 while he was studying sofware development at microverse.\nIf you want to know more about him here are some usefull links:\n- https://github.com/barackm/ \n- https://twitter.com/BarackMukelenga \n- https://www.linkedin.com/in/baraka-mukelenga/")

        elsif @suggestions.food_drinks_suggestion_accepted(received_message)
          if @suggest_food
            send_message(bot, message,
                         'Okay wondefull, you will be served in few minutes. Thanks for your patience.')
          elsif @suggest_drinks
            send_message(bot, message,
                         'Okay wondefull, you will be served in few minutes. Thanks for your patience.')
          end

        elsif @order.help_asked(received_message)
          send_message(bot, message,
                       "HELP\n✅ Here are some keywords you can use to find quickly what you need:\n✔️ menu: to visit our menu\n✔️ suggest: to have my suggestion on what you can order\n✔️ help: if you need any help from me.\n✔️ food or eat: if you are hungry\n\nIf you need to know more about my creator you can just type 👉  creator, or ask any questions regarding that. Thank you!")

        elsif @greeting.check_rejection(received_message)
          if @suggest_food
            send_message(bot, message, "Oh sure? okay no problem #{message.from.first_name},to your thirst 😋.")
            @suggest_food = false
          elsif @suggest_drinks
            send_message(bot, message,
                         "Oh sure? okay no problem #{message.from.first_name}, enjoy your meal 😋.")
            @suggest_drinks = false
          else
            send_message(bot, message,
                         "Oh sure? okay no problem #{message.from.first_name}, if there is something I can help with just let me know.")
          end

        elsif @greeting.ask_for_place(received_message)
          send_message(bot, message,
                       "I am here #{message.from.first_name}, if there is something I can help with just let me know.")

        elsif @order.get_food_order(received_message)
          @suggest_drinks = true
          @suggest_food = false
          choice = message.text
          send_message(bot, message,
                       "Great choice! What about wine? Would you like some red wine with your #{choice}?")

        elsif @order.get_drinks_order(received_message)
          @suggest_food = true
          @suggest_drinks = false
          choice = message.text
          send_message(bot, message,
                       "Wow, Great choice! What about food? Would you like a Chicken with your #{choice}?")

        elsif @greeting.check_greetings(received_message)
          greeting_messages = ["Hi #{message.from.first_name} welcome to our restaurant\nHow are you doing today ?", "Hi there #{message.from.first_name} and welcome to our restaurant\nHow how is it going today ?",
                               "Hi #{message.from.first_name}, It's a pleasure to have you here. welcome to our restaurant\nHow are you doing today ?"].sample

          send_message(bot, message, greeting_messages)

        elsif @greeting.receive_greetings(received_message)
          greeting_answers = ['I am very well thank you, what about you?', 'I am doing great thanks, and you?', 'Oh I am alright thanks, and you?', 'Oh I can\'t complain, what about you?'].sample
          send_message(bot, message, greeting_answers)

        elsif @greeting.receive_compliments(received_message)
          send_message(bot, message,
                       "Oh thank you #{message.from.first_name} for your compliments, I like you too and I am here to help, don't hesitate to tell me whenever you need help ❤️❤️")

        elsif @order.say_thank_you(received_message)
          thanks_messages = ["It's my pleasure.", 'Any time.', 'Take it easy.', 'No worries', 'It\'s my desire.'].sample
          send_message(bot, message, thanks_messages)

        elsif @greeting.ask_for_name(received_message)
          send_message(bot, message,
                       'My name is Raven, what is your name? please answer like: my name is... then your name')

        elsif @greeting.check_greetings_answer(received_message)
          give_greetings_message = ["I'm very well thanks, what new dish would you like to taste today from our best recipes?",
                                    "I'm doing great, what new dish would you like to taste today from our best recipes?",
                                    "I can't complain, what new dish would you like to taste today from our best recipes?"].sample
          send_message(bot, message,
                       give_greetings_message)

        elsif @greeting.check_bad_news(received_message)
          apologies_messages = ["Oh sorry to hear that #{message.from.first_name} I hope everything is going to be okay, I am here if you need help.",
                                "Oh I'm sorry about that, #{message.from.first_name}, I am here if you need help.",
                                "My apologize, #{message.from.first_name}, I am here if you need help."].sample
          send_message(bot, message,
                       apologies_messages)

        elsif @order.menu_asked(received_message)
          send_message(bot, message,
                       "❤️❤️ NIKY RESTAURANT ❤️❤️\n\nFOOD🍔\n✔️ Cheeseburger 🍔\n✔️ Chicken 🍖\n✔️ Reuben sandwich\n✔️ Hot dog 🌭\n✔️ Nachos\n✔️ Cobb Salad 🥗\n✔️ Twinkies\n✔️ Jambalaya\n✔️ Macaronni and chees\n✔️ chips 🍟\n✔️ Cioppino\n✔️ Baked beans\n\nDRINKS🍷\n✔️ Water\n✔️ Coors Light\n✔️ Coffee\n✔️ Miller Lite\n✔️ Budweiser\n✔️ Modelo Espacial\n✔️ Bud light\n✔️ Vodka\n\n\nI hope you have found what were looking for.\n\n✅ If yes just type the exact name of your choice.\n\n✅ If no, sorry... But is you need a suggestion from me just type 👉 suggest.")

        elsif @greeting.say_bye(received_message)
          goodbye_message = ["Okay bye #{message.from.first_name}, see you later.👋", "Take care #{message.from.first_name}, see you later.👋", "Bye #{message.from.first_name}, see you later.👋"].sample
          send_message(bot, message, goodbye_message)

        elsif @order.order_asked(received_message)
          send_message(bot, message,
                       'Great, we have amazing dishes and wines, you will love it I swear Humm😋😋😋 🍖 🍷. If you want to see our menu just type 👉 menu. If you want my suggestion just type 👉 suggest')

        elsif @greeting.got_name(received_message)
          nice_to_meet_you_messages = ["Nice to meet you #{message.from.first_name}, what new dish would you like to taste today from our best recipes?",
                                       "Glad to know you #{message.from.first_name}, what new dish would you like to taste today from our best recipes?",
                                       "Happy to know you #{message.from.first_name}, what new dish would you like to taste today from our best recipes?"].sample
          send_message(bot, message,
                       nice_to_meet_you_messages)

        elsif @greeting.check_affirmation(received_message)
          send_message(bot, message, 'Great, let me know if I can help.')

        elsif @suggestions.suggest_order(received_message)

          send_message(bot, message,
                       @suggestions.order_suggestions)

        else
          send_message(bot, message,
                       "😰 I'm sorry #{message.from.first_name}, I'm not able to undertand that, can you please ask your question differently?")
        end
      end
    end
  end

  def start(input)
    return true if input.include? 'start'

    false
  end

  def send_message(bot, message, text)
    bot.api.send_message(chat_id: message.chat.id, text: text)
  end
end

# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/LineLength
# rubocop:enable Lint/DuplicateBranch
