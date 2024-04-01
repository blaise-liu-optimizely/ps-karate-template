Feature: Cleanup Test Environment

Background:
    * url apiUrl.webhook_host + '/api/scim/v2'
    * def scimApiKey = scimApiKey

Scenario: Collect all groups
  Given path '/Groups'
  And header Authorization = scimApiKey
  When method get
  Then status 200
#   * def groups = response.Resources
#   * def nextGroupToGC = groups.length > 0 ? groups[0].id : null
#   * if (nextGroupToGC) karate.call('this:Garbage collect next group')

Scenario: Collect all users
  Given path 'Users'
  And header Authorization = scimApiKey
  When method get
  Then status 200
#   * def users = response.Resources
#   * def nextUserToGC = users.length > 0 ? users[0].userName : null
#   * if (nextUserToGC) karate.call('this:Garbage collect next user')

# Scenario: Garbage collect next user
#   * def nextUserToGC = karate.get('nextUserToGC')
#   Given path '/Users', nextUserToGC
#   And header Authorization = scimApiKey
#   When method delete
#   Then status 200
#   * karate.call('this:Garbage collect all users')

# Scenario: Garbage collect next group
#   * def nextGroupToGC = karate.get('nextGroupToGC')
#   Given path '/Groups', nextGroupToGC
#   And header Authorization = scimApiKey
#   When method delete
#   Then status 200
#   * karate.call('this:Garbage collect all groups')
