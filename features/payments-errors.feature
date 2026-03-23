Feature: Payment validation errors

  Scenario: Required fields must be filled in
    Given I am on the new payment page
    And I click "Create Payment"
    Then I should see "prohibited this payment from being saved"
    And I should see "Amount can't be blank"
    And I should see "Amount is not a number"
    And I should see "Exchanged at can't be blank"
    And I should see "Due date can't be blank"
    And no payments should exist in the database