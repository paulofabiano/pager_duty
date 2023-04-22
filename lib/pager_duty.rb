require "httparty"

module PagerDuty
  class BaseResource
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

  class User < BaseResource
    def list_users
      self.class.get('/users')
    end
  end

  class Client
    attr_reader :users

    def initialize(auth_token)
      @users = User.new(auth_token)
    end
  end
end