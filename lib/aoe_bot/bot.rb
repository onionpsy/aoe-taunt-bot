require 'telegram/bot'

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

module AoeBot
  class Bot
    def initialize taunts
      Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
        bot.listen do |message|
          number = message.text.to_i - 1
          if message.text.is_integer? and number >= 0 && number < taunts.length
            taunt = taunts[number]
            bot.api.send_voice(
              chat_id: message.chat.id,
              voice: Faraday::UploadIO.new('storage/' + ENV['FOLDER'] + '/' + taunt, 'audio/mpeg')
            )
          end
        end
      end
    end
  end
end
