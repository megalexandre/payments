Feature: Payments

  Scenario: Create a new payment
  
    Given I am on the new payment page
    When I fill in "Amount" with "150.00"
    And I click "Create Payment"
    #And I should see "150.00" in the payments list
