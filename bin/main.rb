#!/usr/bin/env ruby
require 'dotenv'
require_relative '../lib/raven'
require_relative '../lib/greetings/greeting'
require_relative '../lib/orders/order'
require_relative '../lib/orders/suggestions'

Dotenv.load
token = ENV['BOT_NIKY_TELEGRAM_API_KEY']
greeting = Greeting.new
suggestions = Suggestions.new
order = Order.new

Raven.new(token, greeting, order, suggestions)
