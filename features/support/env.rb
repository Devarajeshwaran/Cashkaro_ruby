# frozen_string_literal: true


################################################  Gems required to run this Project ###############################################################################################
require 'capybara/cucumber'
require 'rspec/matchers'
require 'rspec/expectations'
require 'bundler'
Bundler.require
require 'pry'
require 'capybara-screenshot/cucumber'
require 'capybara/poltergeist'
require 'yaml'
require 'phantomjs/poltergeist'

###################################################################################################################################################################################



############################### Basic minimum configuration needed to run automation suite #########################################################################################
# Capybara.default_selector = :xpath
# Capybara.default_driver = :selenium
####################################################################################################################################################################################

# Website - http://www.rubydoc.info/github/jnicklas/capybara/Capybara.configure

Capybara.register_driver :firefox do |app|
  # profile = Selenium::WebDriver::Firefox::Profile.from_name 'default'
  # Capybara::Selenium::Driver.new(app, profile: profile)
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Phantomjs.path # Force install on require
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path, js_errors: false, timeout: 30)
end

############################### Configuration needed to run automation suite in various environments#################################################################################
# Refer cucumber.yml in order to run the suite for various environments through command line
#####################################################################################################################################################################################

ENV['TEST_ENV'] ||= 'qa'
project_root = File.expand_path('../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/cucumber.yml")[ENV['TEST_ENV']][:url]

#####################################################################################################################################################################################
#                                                                       Configure Capybara to suit your needs.
#####################################################################################################################################################################################
#
# ===================================== Configurable options ========================================================================================================================
#
# [app_host = String/nil]                The default host to use when giving a relative URL to visit, must be a valid URL e.g. http://www.example.com
# [always_include_port = Boolean]        Whether the Rack server's port should automatically be inserted into every visited URL (Default: false)
# [asset_host = String]                  Where dynamic assets are hosted - will be prepended to relative asset locations if present (Default: nil)
# [run_server = Boolean]                 Whether to start a Rack server for the given Rack app (Default: true)
# [raise_server_errors = Boolean]        Should errors raised in the server be raised in the tests? (Default: true)
# [server_errors = Array\<Class\>]       Error classes that should be raised in the tests if they are raised in the server and Capybara.raise_server_errors is true (Default: [StandardError])
# [default_selector = :css/:xpath]       Methods which take a selector use the given type by default (Default: :css)
# [default_max_wait_time = Numeric]      The maximum number of seconds to wait for asynchronous processes to finish (Default: 2)
# [ignore_hidden_elements = Boolean]     Whether to ignore hidden elements on the page (Default: true)
# [automatic_reload = Boolean]           Whether to automatically reload elements as Capybara is waiting (Default: true)
# [save_path = String]                   Where to put pages saved through save_(page|screenshot), save_and_open_(page|screenshot) (Default: Dir.pwd)
# [wait_on_first_by_default = Boolean]   Whether Node#first defaults to Capybara waiting behavior for at least 1 element to match (Default: false)
# [automatic_label_click = Boolean]      Whether Node#choose, Node#check, Node#uncheck will attempt to click the associated label element if the checkbox/radio button are non-visible (Default: false)
# [enable_aria_label = Boolean]          Whether fields, links, and buttons will match against aria-label attribute (Default: false)
# [reuse_server = Boolean]               Reuse the server thread between multiple sessions using the same app object (Default: true)
# === DSL Options
#
# when using capybara/dsl, the following options are also available:
#
# [default_driver = Symbol]              The name of the driver to use by default. (Default: :rack_test)
# [javascript_driver = Symbol]           The name of a driver to use for JavaScript enabled tests. (Default: :selenium)
#####################################################################################################################################################################################



######################################### Begin Default Test Running Configuration options with Firefox #############################################################################

Capybara.configure do |config|
  driver_name = ENV['DRIVER']
  default_driver = driver_name.empty? ? 'chrome' : driver_name
  config.default_driver = default_driver.to_sym
  config.javascript_driver = default_driver.to_sym
  config.default_max_wait_time = 10
end

######################################### End Of Default Test running environment setup #############################################################################################




######################################## Begin Screenshot Capture Settings - Default Location for screenshot - reports/screenshots ##################################################

## Help File Link - https://makandracards.com/makandra/30205-taking-screenshots-in-capybara
## Taking screenshots in Capybara
## Capybara-screenshot can automatically save screenshots and the HTML for failed Capybara tests in Cucumber, RSpec or Minitest.
## Requires Capybara-Webkit, Selenium or poltergeist for making screenshots. They're saved into $APPLICATION_ROOT/tmp/capybara by default or the path defined by user


# Keep up to the number of screenshots specified in the hash
Capybara::Screenshot.prune_strategy = { keep: 100 }
Capybara::Screenshot.prune_strategy = :keep_last_run
# Capybara::Screenshot.webkit_options = {width: 1024, height: 768}
Capybara::Screenshot.webkit_options = {width: 2048, height: 1052}
# Capybara.save_path = 'reports/screenshots'
Capybara.save_path = 'reports/screenshots/failedscripts'


####################################### End of Screen Shot capture settings ########################################################################################################
