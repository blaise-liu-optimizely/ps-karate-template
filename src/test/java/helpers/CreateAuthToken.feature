Feature: Create Authentication Token

Scenario: Get access token from the OAuth server

    Given url login.domain + ':443/oauth2/default/v1/token'
    And form field grant_type = 'password'
    And form field username = login.username
    And form field password =  login.password
    And form field client_id =  login.client_id
    And form field scope =  login.scope
    When method post
    Then status 200
    * def accessToken = response.access_token
    * def idToken = response.id_token
    * print 'Access Token: ' + accessToken
    * print 'ID Token: ' + idToken