
module Pages
  module LoginPage

    include RSpec::Matchers

    FACEBOOK_BUTTON = 'close_and_go_fb'
    FACEBOOK_CONFIRM_BUTTON = '__CONFIRM__'
    USER_FIRST_NAME_FIELD = 'firstname'
    USER_EMAIL_FIELD = 'email'
    USER_CONF_EMAIL_FIELD = 'con-email'
    PASSWORD_FIELD = 'pwd-txt'
    PASSWORD_INPUT_FIELD = 'pwd'
    LOGOUT_BUTTON = '.fl.last'
    TERMS_CONDITIONS_CHECK_BOX = 'terms_conditions'
    JOIN_FREE_SUBMIT_BUTTON = 'join_free_submit'
    SIGN_IN_BUTTON = '.fl.signin_popupbox'
    SIGN_IN_IFRAME = '.cboxIframe'
    POP_UP_SIGN_IN_BUTTON = 'sign_in'
    FORGOT_PASSWORD_CONF_TEXT = '.f_pass_s'
    SUBMIT_REQUEST_BUTTON = 'submit_req'
    FORGOT_PASSWORD_LINK = '.fl.link'
    FORGOT_PASSWORD_EMAIL_FIELD = 'from_email'
    POP_UP_EMAILID_FIELD = 'uname'
    MY_ACCOUNT_BUTTON = '.fl.account'
    FB_EMAIL_ID_FIELD = 'email'
    FB_PASSWORD_FIELD = 'pass'
    FB_LOGIN_BUTTON = 'u_0_2'

    def click_join_free_button
      page.find('.fl.last').click
    end

    def click_join_with_facebook_button
      @@popup = window_opened_by do
        page.find_by_id(FACEBOOK_BUTTON).click
      end

      within_window(@@popup) do
        if page.has_button?(FACEBOOK_CONFIRM_BUTTON)
          click_button(FACEBOOK_CONFIRM_BUTTON)
        else
          puts 'Confirm button unavailable'
        end
      end
    end

    def log_into_facebook(fb_emailid, fb_password)
      within_window(@@popup) do
        fill_in FB_EMAIL_ID_FIELD, with: fb_emailid
        fill_in FB_PASSWORD_FIELD, with: fb_password
      end
    end

    def facebook_log_in
      within_window(@@popup) do
          page.find_by_id(FB_LOGIN_BUTTON).click
      end
    end

    def fill_username(name)
      fill_in USER_FIRST_NAME_FIELD, with: name
    end

    def fill_emailid(emailid)
      fill_in USER_EMAIL_FIELD, with: emailid
      fill_in USER_CONF_EMAIL_FIELD, with: emailid
    end

    def fill_password(password_entry)
      page.find_by_id(PASSWORD_FIELD).click
      fill_in PASSWORD_INPUT_FIELD, with: password_entry
    end

    def logout_cashkaro
      page.find(LOGOUT_BUTTON).click
    end

    # def click_sign_in
    #   page.find('.fl.signin_popupbox').click
    # end

    def tick_terms_and_conditions
      check TERMS_CONDITIONS_CHECK_BOX
    end

    def click_join_free_now_button
      page.find_by_id(JOIN_FREE_SUBMIT_BUTTON).click
    end

    def click_sign_in
      # to enable to fill the  conditional set popup windows
      # and then switch to popup window

      page.find(SIGN_IN_BUTTON).click

    end

    def enter_user_details(user_emailid, user_password)
      within_frame(find(SIGN_IN_IFRAME)) do
        fill_in POP_UP_EMAILID_FIELD, with: user_emailid
        page.find_by_id(PASSWORD_FIELD).click
        fill_in PASSWORD_INPUT_FIELD, with: user_password

        click_button(POP_UP_SIGN_IN_BUTTON)
      end
    end

    def click_forgot_password(emailid)
      within_frame(find(SIGN_IN_IFRAME)) do
        page.find(FORGOT_PASSWORD_LINK).click
        fill_in FORGOT_PASSWORD_EMAIL_FIELD, with: emailid

      end
    end

    def click_submit_request_button
      within_frame(find(SIGN_IN_IFRAME)) do
        page.find_by_id(SUBMIT_REQUEST_BUTTON).click
      end
    end

    def verify_password_sent
      within_frame(find(SIGN_IN_IFRAME)) do
        final_message = page.find(FORGOT_PASSWORD_CONF_TEXT).text
        final_message.include? 'Password sent!'
        puts 'New password has been sent successfully'
      end
    end

    def click_sign_in_pop_up_window
      within_frame(find(SIGN_IN_IFRAME)) do
        page.find_by_id(POP_UP_SIGN_IN_BUTTON).click
      end
    end

    def verify_my_account_button
      if page.has_css?(MY_ACCOUNT_BUTTON)
        puts 'User has been successfully logged in to Cashkaro'
      end
    end

  end
end
World(Pages::LoginPage)
