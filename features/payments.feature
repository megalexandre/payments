Feature: Payments Management

  In order to manage my payments
  As a user
  I want to be able to create, view, edit, and delete payments

  Scenario: Create a new payment
  
    Given I am on the new payment page
    When I fill in "Amount" with "150.00"
    And I click "Create Payment"
    Then I should see "Payment was successfully created"
    And I should see "150.00" in the payments list
