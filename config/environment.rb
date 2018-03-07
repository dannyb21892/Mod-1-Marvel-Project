require 'bundler'
Bundler.require
require "digest"
#require_relative "sql_runner"
require_all 'lib'
require_all 'app'
# require_relative "../lib/API_communicator.rb"
# require_relative "../lib/CLI.rb"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

puts "I know what db is"
