module Downloader
  class Chooser
    def self.choose_by(name)
      return Shipio.new if name.downcase == 'shipio'
      return nil
    end
  end
end