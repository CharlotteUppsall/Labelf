*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../PageObjects/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Se Edit Model Name Field
   [Documentation]  When the settings button is clicked Then edit model name field shall be shown
   [Tags]  AG-190
   Given User Is Logged In On Labelf And Have Created An Untained Model
   When User Clicks Settings Button In Model Overview
   Then The Edit Model Name Field Is Shown
