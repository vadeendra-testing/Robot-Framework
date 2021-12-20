*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific
...              Test

Library    SeleniumLibrary



*** Variables ***
${browser}    Chrome
${path}    ../drivers/chromedriver.exe
${url}    https://blazedemo.com/index.php


*** Keywords ***
open the browser with the blazedemo url
    create webdriver    ${browser}    executable_path=${path}
    go to    ${url}
    maximize browser window
    Set Selenium Speed    0.1 Seconds
    Set Selenium Implicit Wait    20 Seconds

select departure city
    Select From List By Value    xpath://select[@name='fromPort']   Philadelphia

select destination city
    Select From List By Value    xpath://select[@name='toPort']     London

click on find flights button
    Click Button    xpath://input[@value='Find Flights']

it should take to next page
    Page Should Contain    Flights from Philadelphia to London

select choose this flight button
    Click Button    xpath:(//input[@value='Choose This Flight'])[3]

it should take to address page
    Page Should Contain    reserved

enter all user data
    Input Text    xpath://input[@id='inputName']    Python User
    Input Text    xpath://input[@id='address']    No.1234, 12th road
    Input Text    xpath://input[@id='city']    Bengaluru
    Input Text    xpath://input[@id='state']    Karnataka
    Input Text    xpath://input[@id='zipCode']    560001
    Select From List By Value    xpath://select[@id='cardType']     amex
    Input Text    xpath://input[@id='creditCardNumber']    69669664454544
    Clear Element Text    xpath://input[@id='creditCardMonth']
    Input Text    xpath://input[@id='creditCardMonth']    11
    Clear Element Text    xpath://input[@id='creditCardYear']
    Input Text    xpath://input[@id='creditCardYear']    2021
    Input Text    xpath://input[@id='nameOnCard']    Python User

click on purchase flight button
    Click Button    xpath://input[@value='Purchase Flight']

it should take to successful purchase page
    Page Should Contain    Thank you for your purchase today
    Page Should Contain    Id


click on destination of the week link
    Click Link    destination of the week! The Beach!

it should display destination of the week page
    Page Should Contain    Destination of the week




close browser sessions
    close browser