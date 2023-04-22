require "httparty"

module PagerDuty
  class Client
    attr_reader :users

    def initialize(auth_token)
      @users = User.new(auth_token)
    end
  end
end