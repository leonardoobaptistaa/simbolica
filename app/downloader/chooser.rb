module Downloader
  class Chooser
    def self.choose_by(name)
      return Shipio.new if name.downcase == 'shipio'
      return ShipioDsym.new if name.downcase == 'shipio_dsym'
      return nil
    end
  end
end