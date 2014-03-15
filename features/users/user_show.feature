Feature: Show User Dashboard
  As a visitor to the website
  I want to see my own dashboard
  So I can see my workouts

    Scenario: Viewing dashboard
      Given I exist as a user
      When I look at my dashboard
      Then I should see my personal details