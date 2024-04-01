Feature: Tests on SCIM Groups API

Background:
    * url 'https://prep.identity-api.optimizely.com/api/scim/v2/'

Scenario: Get all groups
    Given path 'Groups'
    When method get
    Then status 200