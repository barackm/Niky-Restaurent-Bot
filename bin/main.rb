#!/usr/bin/env ruby
require 'dotenv'
require_relative "../lib/Raven.rb"
require_relative '../lib/greetings/Greeting.rb'
require_relative "../lib/orders/Order.rb"
require_relative '../lib/orders/Suggestions.rb'

Dotenv.load
token = ENV['BOT_NIKY_TELEGRAM_API_KEY']
greeting = Greeting.new
suggestions = Suggestions.new
order = Order.new

Raven.new(token,greeting, order, suggestions)