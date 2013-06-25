Feature: Accepting answers
  In order to filter out the answer that answered my question
  As a question asking user
  I want to be able to accept (mark) an answer as accepted

  Scenario: The user who asked the question can accept an answer
    Given I am logged in
    And I asked a question with an answer
    When I visit the question page
    Then I should see buttons to accept the answer

  @javascript
  Scenario: Accepting an answer
    Given I am logged in
    And I asked a question with an answer
    And I am on the question page
    When I click on the accept answer button
    Then I should see it become active