module Uploader
  class Parse < Generic
    attr_accessor :app_folder

    def upload dsym_path
      status = `cd applications/#{@app_folder} && /usr/local/bin/parse symbols #{dsym_path}`
      `cd ../..`

      status
    end

    def configure params
      @app_folder = params[:app_folder]
    end

    def name
      "Parse"
    end
  end
end