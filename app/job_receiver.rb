require 'sinatra'
require 'logger'
require 'dotenv'
Dotenv.load

require_relative 'downloader'
require_relative 'uploader'

post '/job_receiver/from/:downloader/to/:uploader' do
  @logger = Logger.new('log/simbolica.log')

  downloader = Downloader::Chooser.choose_by(params[:downloader])
  @logger.info("Downloading from #{downloader.name}")

  dsym_file_path = downloader.get_dsym_from request.body.string
  @logger.info("Dsym avaiable at: #{dsym_file_path}")

  uploader = Uploader::Chooser.choose_by(params[:uploader])
  uploader.configure params
  status = uploader.upload dsym_file_path
  @logger.info("Upload Status from #{uploader.name}\n#{status}")

  downloader.clean_up
  @logger.info("Cleaned! Done!")

  "Simboliquei!"
end