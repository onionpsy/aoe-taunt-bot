require 'dotenv'
Dotenv.load('.env')

module AoeBot
  if ENV['TOKEN'].nil?
    puts 'Token empty'
    puts
    exit
  end
end
