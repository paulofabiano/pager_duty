# frozen_string_literal: true

require 'thor'
require 'pager_duty'

module PagerDuty
  class CLI < Thor
    class_option :auth_token, required: true, aliases: '-t', desc: 'API authentication token'
    class_option :pretify, required: false, aliases: '-p', desc: 'Pretify JSON responses'

    def initialize(*args)
      super
      @client = PagerDuty::Client.new(options[:auth_token])
    end

    desc 'list_users', 'Fetch all users'
    method_option :limit, default: '25', aliases: '-l', desc: 'Number of results per page'
    method_option :offset, default: '0', aliases: '-o', desc: 'Offset to start pagination search'
    def list_users
      response = @client.list_users(
        limit: options[:limit],
        offset: options[:offset]
      )

      puts output(response)
    rescue PagerDuty::ApiError => e
      say "Error: #{e.message}, Code: #{e.status_code}", :red
    end

    no_commands do
      def self.exit_on_failure?
        true
      end

      def output(response)
        case options[:pretify]
        when 'true'
          JSON.pretty_generate(response)
        else
          response
        end
      end
    end
  end
end
