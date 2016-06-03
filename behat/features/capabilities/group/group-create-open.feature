@api @group @stability @DS-811 @DS-816
Feature: Create Open Group
  Benefit: So I can work together with others in a relative small circle
  Role: As a LU
  Goal/desire: I want to create Open Groups

  Scenario: Successfully create open group
    Given users:
      | name           | mail                     | status |
      | Group User One | group_user_1@example.com | 1      |
      | Group User Two | group_user_2@example.com | 1      |
    And I am logged in as "Group User One"
    And I am on "user"
    And I click "Groups"
    And I click "Add a group"
    When I fill in "Title" with "Test open group"
    And I fill in "edit-field-group-description-0-value" with "Description text"
    And I press "Save"
    And I should see "Test open group" in the "Main content"
    And I should see "Description text"
    And I should see "1 member"
    And I should see "Joined"
    And I should see the link "Read more"

    # DS-761 As a LU I want to view the hero area of a group
    And I click "Test open group"
    And I should see "Test open group" in the "Hero block"
    And I should see "Description text" in the "Hero block"
    And I should see "1 member" in the "Hero block"
    And I should see the button "Joined"
    And I click the xth "1" element with the css ".dropdown-toggle"
    And I should see the link "Leave group"
    And I should see the link "Edit group" in the "Hero block"

    # DS-647 As a LU I want to join a group
    And I logout
    And I am logged in as "Group User Two"
    And I am on "newest-members"
    And I click "Group User One"
  # And I should see "Recently joined groups" in the "Sidebar second"
    And I should see "Test open group" in the "Sidebar second"
  # And I should see the link "View all"
    And I click "Groups"
    And I should see "Test open group" in the "Main content"
  # And I should not see the link "Add a group" in the "Sidebar second"
    And I click "Test open group"
    And I should see the link "Join" in the "Hero block"
    And I click "Join"
    And I should see "Join group Test open group"
    And I should see the button "Cancel"
    And I should see the button "Join group"
    And I press "Join group"
    And I should see "2 member" in the "Hero block"
    And I should see the button "Joined"

