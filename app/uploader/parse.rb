module Uploader
  class Parse < Generic
    def upload dsym_path
      status = `cd applications/#{@app_folder} && /usr/local/bin/parse symbols #{dsym_path}`
      `cd ../..`

      status
    end

    def name
      "Parse"
    end
  end
end