module PagerDuty
  module UserResource
    def list_users
      response = self.class.get('/users')
      response.success? ? response : handle_api_error(response)
    end
  end
end