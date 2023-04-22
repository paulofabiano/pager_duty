module PagerDuty
  module Resources
    class User < BaseResource
      def list_users
        self.class.get('/users')
      end
    end
  end
end