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
          if message.text.is_integer?
            taunt = taunts[message.text.to_i - 1]
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
