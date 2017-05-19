require "aoe_bot/version"
require "aoe_bot/config"
require "aoe_bot/bot"
require 'aoe_bot/storage'

module AoeBot
  def self.run
    storage = AoeBot::Storage.new
    AoeBot::Bot.new storage.taunts
  end
end
