# frozen_string_literal: true

module PagerDuty
  module UserResource
    def list_users(limit: nil, offset: nil)
      options =  { query: { limit:, offset: }.compact }

      response = self.class.get('/users', options)
      response.success? ? parse_users(response) : handle_api_error(response)
    end

    private

    def parse_users(response)
      JSON.parse(response.body)
    end
  end
end
