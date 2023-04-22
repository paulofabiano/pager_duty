module PagerDuty
  module Resources
    class User < Base
      def list_users
        self.class.get('/users')
      end
    end
  end
end