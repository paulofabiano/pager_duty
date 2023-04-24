require 'thor'
require 'pager_duty'

module PagerDuty
  class CLI < Thor
    class_option :auth_token, required: true, aliases: '-t', desc: 'API authentication token'

    def initialize(*args)
      super
      @client = PagerDuty::Client.new(options[:auth_token])
    end

    desc 'list_users', 'Fetch all users'
    def list_users
      begin
        response = @client.list_users
        
        puts response
      rescue PagerDuty::ApiError => e
        say "Error: #{e.message}, Code: #{e.status_code}", :red
      end
    end

    no_commands {
      def self.exit_on_failure?
        true
      end
    }
  end
end