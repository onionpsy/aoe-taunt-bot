require 'dotenv'
Dotenv.load('.env')

module AoeBot
  print 'Token empty' if ENV['TOKEN'].nil?
end
