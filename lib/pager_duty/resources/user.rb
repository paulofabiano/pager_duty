module PagerDuty
  module UserResource
    def list_users(limit: nil, offset: nil)
      options =  { query: { limit:, offset: }.compact }

      response = self.class.get('/users', options)
      response.success? ? response : handle_api_error(response)
    end
  end
end