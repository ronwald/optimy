*** Variables ***
#------------------ START VARIABLES------------------#
${projectPath}    ${CURDIR}
${ShortSleepTime}    3s
${appURL}    https://automationinterface1.front.staging.optimy.net/en/ 
${browser}    chrome
${username}    optimyautomationtester@gmail.com
${password}    yRMhojb7
${firstname}    Ronwald
${lastname}    Test
${postalcode}    1000
${unitNumber}    Unit 100 Test St
${country}     Belgium
${role}    Automation tester
${tools}    JIRA
${careerObjective}     Test career Objective

#------------------ END VARIABLES------------------#


#------------------ START OBJECT LOCATORS------------------#
#-----login--------
${login_link}   css=header > div > div > a
${cookie_popup}   css=#cookie-close-button > span
${login_email_textbox}     css=#login-email
${login_password_textbox}     css=#login-password
${login_button}    css=#login-form > div> button

#-----home page--------
${submit_new_application_link}   css=#content > div > div > div > div > a
${submit_new_application_link2}   css=#content > div > div > div > div > section > div > a

#-----fill out application forms--------
${submit_new_application_link}   css=#content > div > div > div > div > a
${firstname_textbox}    css=input[aria-label='First name']
${lastname_textbox}    css=input[aria-label='Last name']
${unitNo_textbox}    css=textarea[aria-label='Unit no/House no, Street']
${postalcode_textbox}    css=input[aria-label='Select postal code']
${country_dropdown}    css=select[aria-label='Country']
${uploadPhoto_button}    //input[@type="file"]
${male_radiobutton}    css=label[aria-label='Male']
${role_dropdown}    css=select[aria-label="Select a role you're applying for"]
${careerObjective_iframe}    css=#cke_1_contents > iframe
${careerObjective_textbox}    css=body[role='textbox']
${nextScreen_button}    css=button[id='navButtonNext']
#-----summary screen-------
${submit_button}    css=button[class='btn btn-primary ml-md-auto']

#------------------ END OBJECT LOCATORS------------------#