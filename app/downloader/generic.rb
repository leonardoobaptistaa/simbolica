require "httparty"
require 'securerandom'
require 'zip'

module Downloader
  class Generic
    attr_accessor :download_link

    def download link
      file_path = "/tmp/#{SecureRandom.hex}.app.DSYM.zip"
      file = File.open(file_path, 'wb' ) do |output|
        output.write HTTParty.get(link)
      end
      file_path
    end

    def unzip file_path
      extracted_file_path = nil

      Zip::File.open(file_path) { |zip_file|
       zip_file.each { |f|
         f_path=File.join('/tmp', f.name)
         extracted_file_path = f_path if extracted_file_path.nil?

         FileUtils.mkdir_p(File.dirname(f_path))
         zip_file.extract(f, f_path) unless File.exist?(f_path)
       }
      }

      extracted_file_path.chop
    end
  end
end