module Uploader
  class Jenkins < Generic
    attr_accessor :job_build_url

    def upload dsym_path
      url = URI.parse(URI.encode(@job_build_url.strip))
      if url.query.nil?
        url.query = "?delay=0sec"
      else
        url.query << "&delay=0sec"
      end
      url.query << "&dsym_url=#{dsym_path}"
      HTTParty.post(url)

      auth = {username: ENV['JENKINS_LOGIN'], password: ENV['JENKINS_TOKEN']}
      HTTParty.post(url, basic_auth: auth)
    end

    def configure params
      @job_build_url = params[:job_build_url]
    end

    def name
      "Jenkins Parametrized Build"
    end
  end
end