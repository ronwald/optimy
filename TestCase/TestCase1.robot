*** Settings ***
Library     SeleniumLibrary
Resource    ../Keywords/Application.robot



*** Test Cases ***
Scenario: User Can Submit New Application
    [Documentation]    This test will run 10 times, each test will use different sets of data (role, tools, country)
    [Template]  Submitting New Application
    Automation tester               JIRA                      Belgium
    Automation tester               Java                      Alaska
    Manual + Automation tester      Spreadsheet               Austria
    Manual + Automation tester      Python                    Bahamas
    Automation tester               Robot Framework           Canada
    Manual tester                   JIRA                      Dominica
    Manual tester                   Java                      Egypt
    Manual + Automation tester      Spreadsheet               Finland
    Manual + Automation tester      Python                    Greece
    Manual tester                   Robot Framework           Japan



*** Keywords ***
Submitting New Application
    [Arguments]  ${role}  ${tools}   ${country}
    Given User accesses the Home page
    And User Login using the credentials
    And User click Submit a new application button
    And User Fill-out the forms    ${role}  ${tools}   ${country}
    And User Verify All Inputted Values Are Displayed In Summary Screen   ${role}   ${tools}    ${country}
    And User Click Validate and send button
    Then Verify User Is Redirected To Confirmation Page