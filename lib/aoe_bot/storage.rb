module AoeBot
  class Storage
    attr_accessor :taunts
    
    def initialize
      taunts = Dir.entries('storage/' + ENV['FOLDER']).select do |f|
        f =~ /.+\.(mp3|wav|ogg)/ and !File.directory? f
      end
      
      @taunts = taunts.sort_by do |f|
        f.scan(/(\d{1,2}).+/)
      end
    end
  end
end
