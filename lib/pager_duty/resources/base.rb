module PagerDuty
  module Resources
    class Base
      include HTTParty

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
    end
  end
end