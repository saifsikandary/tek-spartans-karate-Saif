Feature: API testing for Security Functions
Background: Setup test
Given url 'https://dev.insurance-api.tekschool-students.com'
Given path '/api/token'

  @US_1
  Scenario: Valid token with valid credential
    Given request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then print response
    Then status 200
    Then assert response.username == "supervisor"

  @US_2
  Scenario Outline: Valid token with invalid credential
    Given request
      """
      {
        "username": "<username>",
        "password": "<tek_supervisor>"
      }
      """
    When method post
    Then status <statusCode>
    # Add assert for errorMessage
    Examples:
    |username    |  password      | statusCode  |
    |Supervisorx | tek_supervisor | 404         |
    |supervisor  | wrong password | 400         |
