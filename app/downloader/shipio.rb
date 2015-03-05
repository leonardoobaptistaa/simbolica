require 'json'
module Downloader
  class Shipio < Generic
    attr_accessor :json, :file_path, :zip_file_path

    def get_dsym_from(body)
      @json = JSON.parse body
      link = get_download_link
      @zip_file_path = download link
      @file_path = unzip @zip_file_path
    end

    def clean_up
      FileUtils.rm_rf(@file_path)
      FileUtils.rm_rf(@zip_file_path)
    end

    def name
      "Ship.io"
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