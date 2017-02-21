# frozen_string_literal: true
# frozen_string_literal: true


############################################################################ Hooks & Its Use In the automation framework #####################################################################################################################################
##############################################################################################################################################################################################################################################################

############################################## Working Code - Define the display area for the browser during script execution #################################################################################################################################

 Before do
    is_selenium = Capybara.page.driver.is_a?(Capybara::Selenium::Driver)
    Capybara.page.driver.browser.manage.window.resize_to(1280, 1024) if is_selenium
    # Capybara.page.driver.browser.manage.window.maximize if is_selenium
  end

############################################### Deleting screenshots before running a Feature file ###########################################################################################################################################################

  Before('@screenshot') do
    FileUtils.mv('/Users/da/Projects/Dhuddu/reports/screenshots/passedscripts/', '/Users/da/Projects/Dhuddu/reports/screenshots/backupscreenshots')
    FileUtils.rm_rf(Dir.glob('/Users/da/Projects/Dhuddu/reports/screenshots/passedscripts/*'))
  end

############################################## Working Code - Capture screen shot for all failed steps ########################################################################################################################################################

# After do |scenario|
#
#   time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
#   name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
#
#   if scenario.failed?
#
#     ##### Option 1
#     # page.driver.browser.save_screenshot("reports/screenshots/#{scenario.__id__}.png")
#     # embed("#{scenario.__id__}.png", "image/png", "screenshots")
#
#     ##### Option 2
#
#     page.driver.browser.save_screenshot("reports/screenshots/#{name_of_scenario}.png")
#     embed("#{name_of_scenario}.png", "image/png", "reports/screenshots")
#
#   end
# end

############################################## Working Code - Capture screen shot for all passed steps ########################################################################################################################################################

# After do |scenario|
#
#   time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
#   name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
#
#   if scenario.passed?
#
#     ##### Option 1
#     # page.driver.browser.save_screenshot("reports/screenshots/#{scenario.__id__}.png")
#     # embed("#{scenario.__id__}.png", "image/png", "screenshots")
#
#     ##### Option 2
#
#     page.driver.browser.save_screenshot("reports/screenshots/#{name_of_scenario}.png")
#     embed("#{name_of_scenario}.png", "image/png", "reports/screenshots")
#
#   end
# end


############################################## Working Code - Alternate approach - to capture screenshots & Stored in Local Drive / path provide ###############################################################################################################


# Create a directory for storing snapshot if Directory is not present

dir_path = '/Users/da/Projects/Dhuddu/reports/screenshots/passedscripts'

unless Dir.exist?(dir_path)
 Dir.mkdir(dir_path,0777)
 puts "=========  Directory is created at #{dir_path}"
else
 puts "=========  Directory is exist at #{dir_path}"
end

# Run after each scenario
After do |scenario|
 #Check, scenario is failed?
 # if scenario.failed?
 #Check, scenario is passed?
 if scenario.passed?

   time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
   name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
   puts "Name of snapshot is - #{name_of_scenario}"
   file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
   page.driver.browser.save_screenshot file_path
   puts "Snapshot is taken for the scenario - "
   puts "#===========================================================#"
   puts "Scenario:: #{scenario.name}"
   puts "#===========================================================#"
 end
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------