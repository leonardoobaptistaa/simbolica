module Uploader
  class Chooser
    def self.choose_by(name)
      return Parse.new if name.downcase == 'parse'
      return nil
    end
  end
end