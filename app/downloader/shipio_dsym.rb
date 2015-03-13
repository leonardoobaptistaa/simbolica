require 'json'
module Downloader
  class ShipioDsym < Generic
    attr_accessor :json, :file_path, :zip_file_path

    def get_dsym_from(body)
      @json = JSON.parse body
      get_download_link
    end

    def clean_up
    end

    def name
      "Ship.io Dsym's Link"
    end

private
    def get_download_link
      @json["build"]["artifacts"].each do |artifact|
        next unless artifact["name"].end_with? "app.dSYM.zip"
        return artifact["download_url"]
      end
    end
  end
end