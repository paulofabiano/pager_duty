require "httparty"

Dir[File.join("./lib", "**/*.rb")].each do |file|
  require file
end

module PagerDuty
  class ApiError < StandardError
    attr_reader :status_code

    def initialize(message, status_code = nil)
      super(message)
      @status_code = status_code
    end
  end

  class Client
    include HTTParty
    include UserResource

    def initialize(auth_token)
      self.class.base_uri 'https://api.pagerduty.com'
      self.class.default_options.merge!(
        headers: {
          'Accept' => 'application/vnd.pagerduty+json;version=2',
          'Authorization' => "Token token=#{auth_token}",
          'Content-Type' => 'application/json'
        }
      )
    end

    private

    def handle_api_error(response)
      case response.code
      when 400..499
        message = parser_error_message(response) || "Client error  (#{response.code})"
      when 500..599
        message = "Server error (#{response.code})"
      else
        message = "An unkown error ocurred (#{response.code})"
      end

      raise ApiError.new(message, response.code)
    end

    def parser_error_message(response)
      JSON.parse(response.body)['error']['message']
    rescue JSON::ParserError
      'An error ocurred while parsing the API response'
    end
  end
end