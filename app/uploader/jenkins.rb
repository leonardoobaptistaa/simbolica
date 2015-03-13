module Uploader
  class Jenkins < Generic
    attr_accessor :job_build_url

    def upload dsym_path
      url = URI.parse(URI.encode(@job_build_url.strip))
      url.query = "delay=0sec"
      url.query << "&dsym_url=#{dsym_path}"
      HTTParty.post(url)
    end

    def configure params
      @job_build_url = params[:job_build_url]
    end

    def name
      "Jenkins Parametrized Build"
    end
  end
end