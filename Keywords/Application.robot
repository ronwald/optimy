*** Settings ***
Library         SeleniumLibrary
Resource    ../Resource/Variables.robot

*** Keywords ***
User accesses the Home page
    Open Browser   ${appURL}     ${browser} 
    Maximize Browser Window

User Login using the credentials
    Sleep    2
    Handle Alert
    Sleep    1
    Click Element   ${login_link}
    Input Text   ${login_email_textbox}     ${username} 
    Sleep    1
    Input Text   ${login_password_textbox}   ${password}   
    Sleep    1
    Click Element   ${login_button}  

User click Submit a new application button
    Sleep    1
    Click Element   ${submit_new_application_link} 
    Sleep    1
    Click Element    ${submit_new_application_link2}
    Sleep    5

User Fill-out the forms
    [Arguments]    ${role}   ${tools}    ${country}
    Page Should Contain    Fill-out all forms
    Enter Personal Details
    Enter Address
    Select Postal Code
    Select Country   ${country}
    Upload Photo
    Select Gender
    Select Role    ${role}
    Select Tools    ${tools} 
    Enter Career Objective
    

Enter Personal Details
    Input Text    ${firstname_textbox}    ${firstname} 
    Input Text    ${lastname_textbox}    ${lastname} 
    Sleep    1


Enter Address
    Input Text    ${unitNo_textbox}      ${unitNumber} 
    Sleep    1

Select Postal Code
    Input Text    ${postalcode_textbox}     1000
    Sleep    2
    Press Keys    ${postalcode_textbox}    DOWN
    Sleep    1
    Press Keys    ${postalcode_textbox}    ENTER

Select Country
    [Arguments]    ${country} 
    Select From List By Label    ${country_dropdown}    ${country} 

Upload Photo
    Sleep    2
    Choose File     ${uploadPhoto_button}     ${projectPath}${/}Upload File${/}myPhoto.png
    Sleep    2

Select Gender
    Wait Until Element Is Enabled    ${male_radiobutton} 
    Click Element   ${male_radiobutton} 
    Sleep    2

Select Role
    [Arguments]    ${role}
    Wait Until Element Is Enabled    ${role_dropdown}  
    Select From List By Label    ${role_dropdown}     ${role}
    Sleep    2

Select Tools
    [Arguments]    ${tools}
    Click Element   css=label[aria-label='${tools}']
    Sleep    2

Enter Career Objective
    Select Frame     ${careerObjective_iframe} 
    Sleep    2
    Wait Until Element Is Enabled    ${careerObjective_textbox}  
    Sleep    2
    Scroll Element Into View     ${careerObjective_textbox} 
    Input Text       ${careerObjective_textbox}      ${careerObjective} 
    Sleep    2
    Unselect Frame
    Sleep    2
    Wait Until Element Is Enabled    ${nextScreen_button} 
    Click Element   ${nextScreen_button} 
    Sleep    2


User Verify All Inputted Values Are Displayed In Summary Screen
    [Arguments]    ${role}   ${tools}    ${country}
    Sleep    5
    Wait Until Page Contains       Summary
    Page Should Contain    ${firstname} 
    Page Should Contain    ${lastname} 
    Page Should Contain    ${unitNumber} 
    Page Should Contain    1000 - Bruxelles / Brussel    
    Page Should Contain    ${country} 
    Page Should Contain    Male
    Page Should Contain    ${role} 
    Page Should Contain    ${tools} 
    Page Should Contain    ${careerObjective}  
    Capture Page Screenshot

User Click Validate and send button
    Wait Until Element Is Enabled    ${submit_button}
    Click Element     ${submit_button}
    Sleep    5


Verify User Is Redirected To Confirmation Page
    Page Should Contain      Thank you for submitting your project
    Capture Page Screenshot
    Close Browser
    
Handle Alert
    # THIS IS TO HANDLE THE COOKIE POPUP
    ${present}=  Run Keyword And Return Status    Page Should Contain    This website uses cookies
    Log  ${present} 
    Run Keyword If    ${present}    Click Element    ${cookie_popup}
    Log  ${present} 
