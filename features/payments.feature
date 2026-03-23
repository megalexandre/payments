Feature: Payments

  Scenario: Create a new payment
  
    Given I am on the new payment page
    When I fill in "Amount" with "150.00"

    When I fill in "Exchanged at" with "2026-01-10T00:00"
    When I fill in "Due date" with "2026-02-01T00:00"
    
    And I click "Create Payment"
    Then I should see "Payment was successfully created."
    And I should see "R$ 150,00" in the payments list
    And a payment with:
      | amount | due date         | exchanged at       |
      | 150.00 | 2026-02-01T00:00 | 2026-01-10T00:00   |
    