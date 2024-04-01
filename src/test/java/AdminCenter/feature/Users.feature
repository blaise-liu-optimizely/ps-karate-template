Feature: Tests on Admin Center Users API

Background:
    #* def accessToken = 'eyJraWQiOiJuUjhOM2UwbUtxdk93enp4NHdNeTRRMlZDRTRDUFdybzdQdDdNekxraFJvIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULlAxMUoyeXpuTzhnVmVXYnNxRVpwWXNfWkhIdmZLZjhjdFVLbW54dEVkRzQub2FyenMwcXBsRkJwZTFzdmUxZDYiLCJpc3MiOiJodHRwczovL3ByZXAubG9naW4ub3B0aW1pemVseS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0Iiwic3ViIjoiamlhbnFpbmcubGl1QG9wdGltaXplbHkuY29tIiwiaWF0IjoxNzExOTcwODM5LCJleHAiOjE3MTE5NzQ0MzksImNpZCI6IjBvYTFhdXBjc3JtOXJUblAxMGg4IiwidWlkIjoiMDB1NzNoeG1jc0dNVVQ2M2gxZDciLCJzY3AiOlsicHJvZmlsZSIsImlkeF9pbnN0YW5jZXBlcm1pc3Npb25zIiwib2ZmbGluZV9hY2Nlc3MiLCJlbWFpbCIsIm9wZW5pZCJdLCJhdXRoX3RpbWUiOjE3MTEzNzg3MTcsImluc3RhbmNlX3Blcm1pc3Npb25zIjoiaHR0cHM6Ly9wcmVwLnVzZXJtZ210LWFwaS5vcHRpbWl6ZWx5LmNvbS9hcGkvdXNlcnMvamlhbnFpbmcubGl1QG9wdGltaXplbHkuY29tL2luc3RhbmNlcGVybWlzc2lvbnMifQ.bZo_rgcW5JmAI4EWL1pECFWXl703_jie8PEEksKVz1zE7GI0-3vfQMvVVIBNKUxWihEpbxaA5zKOulTFaQTbrM_kEMf4DWj54JMxcY_HFqNknswaZgbNs3cLURXd3mjr6fkMvlAZJoHcV_WFdI6wYffy762XgGHCzlUcIAngn137ManQ2eFmcJ0fmMgSlfP21emVD04F373YC87YL2-RhEF2M-lftji8lojEb_MXKtnlYxrhWAu7-tWvxEmidBswgP7bx6X2etwMzcxjvFKsNbHut5kseiGQQiCBaGLGiTrU23sz-6Ar-1IGQ56SqLF9eLK8ALBZAZSped7vBlDMdw'
    #* header Authorization = 'Bearer ' + accessToken
    * def tokenResponse = call read('classpath:helpers/CreateAuthToken.feature') 
    * def accessToken = tokenResponse.accessToken    
    * print 'Token Response:', karate.toJson(tokenResponse)

    * print 'Print accessToken: ' + accessToken
    
    * url apiUrl.admincenter_host + '/api'

Scenario: Test GET Users API with Authorization
    Given path 'users'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method get
    Then status 200

# Scenario: Retrieve users from the User Management API with specific offset and size
#     Given path 'users'
#     And param offset = 3
#     And param size = 3
#     When method get
#     Then status 200    
#     * print 'Response:', response.items.length

# Scenario: Create, confirm, and remove a new user
    
#     * def userFirstName = 'Blaise'
#     * def userLastName = 'Liu'
#     * def userEmail = 'jianqing.liu+042@optimizely.com'
#     * def userHomeOrganizationId = 'dd1d1a94c2ad4fa6960eadeba4e77b4b'

#     # Part 1: Create the user
#     Given path 'users'
#     And request 
#     """
#     {
#         "FirstName": "#(userFirstName)",
#         "LastName": "#(userLastName)",
#         "Email": "#(userEmail)",
#         "HomeOrganizationId": "#(userHomeOrganizationId)"
#     }
#     """
#     When method post
#     Then status 200
#     And match response.FirstName == userFirstName
#     And match response.LastName == userLastName
#     And match response.Email == userEmail
#     And match response.HomeOrganizationId == userHomeOrganizationId

#     # Part 2: Retrieve and confirm the created user
#     Given path 'users/' + userEmail
#     And header Authorization = 'Bearer ' + accessToken
#     When method get
#     Then status 200
#     And match response.FirstName == userFirstName
#     And match response.LastName == userLastName
#     And match response.Email == userEmail
#     And match response.HomeOrganizationId == userHomeOrganizationId

#     # Part 3: Remove the created user
#     Given path 'users/' + userEmail
#     And header Authorization = 'Bearer ' + accessToken
#     When method delete
#     Then status 204