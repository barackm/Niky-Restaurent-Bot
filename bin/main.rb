#!/usr/bin/env ruby
require 'dotenv'
require_relative "../lib/Raven.rb"
require_relative '../lib/greetings/Greeting.rb'
Dotenv.load
token = ENV['BOT_NIKY_TELEGRAM_API_KEY']
greeting = Greeting.new

Raven.new(token,greeting)