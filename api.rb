# frozen_string_literal: true

require 'httparty'

class BaseResource
  include HTTParty

  class ApiError < StandardError
    attr_reader :status_code

    def initialize(message, status_code = nil)
      super(message)
      @status_code = status_code
    end
  end

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
      message = "client error (#{response.code})"
    when 500..599
      message = "server error (#{response.code})"
    else
      message = "unknown error (#{response.code})"
    end

    raise ApiError.new(message, response.code)
  end
end

class User < BaseResource
  def list_users(limit: nil, offset: nil)
    options = { query: { limit:, offset: } }

    response = self.class.get('/users', options)
    response.success? ? response : handle_api_error(response)
  rescue ApiError => e
    puts e.message
  end
end

class Client
  attr_reader :users

  def initialize(auth_token)
    @users = User.new(auth_token)
  end
end

client = Client.new('y_NbAkKc66ryYTWUXYEu')

puts client.users.list_users(limit: 1, offset: 0)
