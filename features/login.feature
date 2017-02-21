Feature: Cashkaro Login functionality

  Background:
    Given I am on Cashkaro Login Page

  @smoke
  Scenario Outline: Member should be able to Sign up with Cashkaro using Join with Facebook
    When I click on Join Free button
    And I click on join with facebook button
    And I enter the facebook user details with <emailid> as username and <password> as password

    Examples:
      | emailid                  | password    |
      | Amazing222@gmail.com     | Chennai@123 |

  @test
  Scenario Outline: Member should be able to Sign up with Cashkaro using Join with regular sign up
    When I click on Join Free button
    And I fill up <name> in full name field
    And I fill up <emailid> in email address and confirm email address fields
    And I fill up <password> in password field
    And I tick the terms and conditions checkbox
    Then I click on Join free now button
    And I logout of Cashkaro
    Then I click on Sign in button
    Then I enter user details with <emailid> as email address and <password> as password

    Examples:
      | name | emailid                  | password   |
      | Deva | Amazing333@gmail.com     | Chennai@123|

  @smoke
  Scenario Outline: Forgot password
    Then I click on Sign in button
    Then I click on Forgot password link and I fill up <emailid> in email address field
    Then I click on submit request button
    Then I verify if the password has been sent

    Examples:
      | emailid |
      |saff@gmail.com|

  @smoke
  Scenario Outline: Regular sign in
    Then I click on Sign in button
    Then I enter user details with <emailid> as email address and <password> as password
    Then I click on Sign in button in pop up window
    And I logout of Cashkaro

    Examples:
      | emailid                  | password   |
      | Amazing333@gmail.com     | Chennai@123|



