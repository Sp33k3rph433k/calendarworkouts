Feature: Sign up
  In order be able to track workouts
  As a user
  I need to be able to sign up

    Background:
      Given I am not logged in

    Scenario: User signs up with valid data
      When I sign up with valid user data
      Then I should see a successful sign up message
      #and be be redirected to a getting started page

    Scenario: User signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid email message

    Scenario: User signs up without a password
      When I sign up without a password
      Then I should see a missing password message

    Scenario: User signs up without password confirmation
      When I sign up without a password confirmation
      Then I should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message