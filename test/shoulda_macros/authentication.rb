module ShouldaMacros
  class ActionController::TestCase
    def self.should_require_user(path, action = :get)
      context "On #{action} to #{path}" do
        setup do
          eval("#{action} :#{path}")
        end

        should_redirect_to("The Login Page") { login_url }
        should_set_the_flash_to "You must be logged in to access this page"
      end
    end
  end
end