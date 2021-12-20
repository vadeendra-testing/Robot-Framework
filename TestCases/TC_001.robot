*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/resource.robot


*** Test Cases ***
TC_001_BlazeDemo_E2E
    open the browser with the blazedemo url
    select departure city
    select destination city
    click on find flights button
    it should take to next page
    select choose this flight button
    it should take to address page
    enter all user data
    click on purchase flight button
    it should take to successful purchase page

    close browser sessions


TC_002_BlazeDemo_Destination_of_the_week_link
    open the browser with the blazedemo url
    click on destination of the week link
    it should display destination of the week page

    close browser sessions


