module PagerDuty
  module UserResource
    def list_users
      self.class.get('/users')
    end
  end
end