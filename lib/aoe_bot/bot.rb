require 'telegram/bot'

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

module AoeBot
  class Bot
    def initialize taunts
      now = Time.now.to_i
      Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
        bot.listen do |message|
          if message.text
            number = message.text.to_i - 1
            if message.date > now and 
               message.text.is_integer? and
               number >= 0 && number < taunts.length
              
              taunt = taunts[number]
              bot.api.send_voice(
                chat_id: message.chat.id,
                reply_to_message_id: message.message_id,
                voice: Faraday::UploadIO.new('storage/' + ENV['FOLDER'] + '/' + taunt, 'audio/mpeg')
              )
            end
          end
        end
      end
    end
  end
end



