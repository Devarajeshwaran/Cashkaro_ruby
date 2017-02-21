# frozen_string_literal: true

module Pages
  module BasePage
    include RSpec::Matchers

    def visit_page
      @session = Capybara.current_session
      # @session.visit('/')
      @session.visit($BASE_URL)
      puts 'The functional testing suite is running on: ' + $BASE_URL
      # @session.visit(QA_ENV_LINK) - This option should work when we define the portal link as a variable and used that variable to navigate
    end

  end
end
World(Pages::BasePage)



