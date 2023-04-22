require "httparty"

Dir[File.join("./lib", "**/*.rb")].each do |file|
  require file
end

module PagerDuty
  class Client
    attr_reader :users

    def initialize(auth_token)
      @users = PagerDuty::Resources::User.new(auth_token)
    end
  end
end