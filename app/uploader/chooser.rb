module Uploader
  class Chooser
    def self.choose_by(name)
      return Parse.new if name.downcase == 'parse'
      return Jenkins.new if name.downcase == 'jenkins'
      return nil
    end
  end
end