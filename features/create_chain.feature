Feature: Create Chain
  In order to show off my signal flow
  As a User
  I want to be able to create a chain of gear

  Scenario: When logged in
    Given I am logged in as "test@example.com/password"
    When I go to the new chain page
    Then I should see "Name"
    And I should see "Notes"

  Scenario: When not logged in
    Given I am not logged in
    When I go to the new chain page
    Then I should see "You must be logged in to access this page"
    And I should be on the login page

  Scenario: Create a Chain
    Given I am logged in as "test@example.com/password"
    When I go to the new chain page
    And I fill in "Name" with "Awesome Guitar"
    And I fill in "Notes" with "A nice sounding setup for my guitar rig, man."
    And I press "Create Chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Mic"
    And I should see "Line In"
    And I should see "Awesome Guitar"
    And I should see "A nice sounding setup for my guitar rig, man."

  Scenario: Adding audio
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I attach the file at "test/audio_files/guitar.aif" to "chain_audio"
    And I fill in "Title" with "Song Name"
    And I fill in "Performer" with "DJ Bad-Knee Bob"
    And I fill in "Year Recorded" with "1994"
    And I fill in "Studio" with "BRC Audio Productions"
    And I press "Submit"
    Then I should be viewing the chain "Awesome Guitar"
    And I should not see "It needs an audio file."
    And I should see "Song Name"
    And I should see "DJ Bad-Knee Bob"
    And I should see "1994"
    And I should see "BRC Audio Productions"

  Scenario: Create a Chain with tags
    Given I am logged in as "test@example.com/password"
    When I go to the new chain page
    And I fill in "Name" with "Awesome Guitar"
    And I fill in "Notes" with "A nice sounding setup for my guitar rig, man."
    And I fill in "Tags" with "Guitar, Overdrive, Rock 'N Roll"
    And I press "Create Chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Mic"
    And I should see "Line In"
    And I should see "Awesome Guitar"
    And I should see "A nice sounding setup for my guitar rig, man."
    And I should see "Guitar"
    And I should see "Overdrive"
    And I should see "Rock 'N Roll"

  Scenario: Create a Chain without Audio
    Given I am logged in as "test@example.com/password"
    When I go to the new chain page
    And I fill in "Name" with "Awesome Guitar"
    And I fill in "Notes" with "A nice sounding setup for my guitar rig, man."
    And I press "Create Chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "This chain is incomplete."
    And I should see "It needs an audio file."

  Scenario: Adding a Microphone
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "Mic"
    And I follow "New Mic"
    And I fill in "Make" with "Shure"
    And I fill in "Model" with "KSM32"
    And I fill in "Manufactured Date" with "2008"
    And I select "Condenser" from "Type"
    And I select "Large" from "Diaphragm Size"
    And I select "Cardioid" from "Pattern"
    And I press "Create Mic"
    And I follow "Add this mic to your chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Shure"
    And I should see "KSM32"
    And I should see "2008"
    And I should see "Condenser"
    And I should see "Large"
    And I should see "Cardioid"
    And I should see "Preamp"
    And I should not see "It needs an input source."
    And I should not see "Start with"

  Scenario: Adding a line source
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "Line In"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Line In"
    And I should not see "It needs an input source."
    And I should not see "Start with"

  Scenario: Adding a Preamp
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "Preamp"
    And I follow "New Preamp"
    And I fill in "Make" with "Summit"
    And I fill in "Model" with "MPC-100A"
    And I fill in "Manufactured Date" with "2008"
    And I select "Tube" from "Circuitry"
    And I press "Create Preamp"
    And I follow "Add this preamp to your chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Summit"
    And I should see "MPC-100A"
    And I should see "2008"
    And I should see "Tube"
    And I should not see "It needs a preamp."
    And I should see "Start with"

  Scenario: Adding a Compressor
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "Dynamics"
    And I follow "New Dynamics Processor"
    And I select "Compressor" from "Type"
    And I select "Hardware" from "Interface"
    And I select "Tube" from "Circuitry"
    And I select "Optical" from "Compression Type"
    And I fill in "Make" with "ART"
    And I fill in "Model" with "Pro VLA"
    And I fill in "Manufactured Date" with "2008"
    And I press "Create Dynamics Processor"
    And I follow "Add this dynamics processor to your chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "ART"
    And I should see "Pro VLA"
    And I should see "2008"
    And I should see "Tube"
    And I should see "Optical"
    And I should see "Compressor"
    And I should see "Start with"

  Scenario: Adding an Effects Processor
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "Effects"
    And I follow "New Effects Processor"
    And I select "Other" from "Type"
    And I fill in "Make" with "Lexicon"
    And I fill in "Model" with "PCM70"
    And I fill in "Manufactured Date" with "1988"
    And I press "Create Effects Processor"
    And I follow "Add this effects processor to your chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Lexicon"
    And I should see "PCM70"
    And I should see "1988"

  Scenario: Adding an EQ
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    And I follow "EQ"
    And I follow "New Equalizer"
    And I select "Parametric" from "Type"
    And I fill in "Make" with "Sontec"
    And I fill in "Model" with "MEQ250A"
    And I fill in "Manufactured Date" with "1998"
    And I fill in "Bands" with "5"
    And I press "Create Equalizer"
    And I follow "Add this equalizer to your chain"
    Then I should be viewing the chain "Awesome Guitar"
    And I should see "Sontec"
    And I should see "MEQ250A"
    And I should see "1998"
    And I should see "Parametric"
    And I should see "5 band"

  Scenario: Chain without an input source
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have not added an input source to "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    Then I should see "This chain is incomplete."
    And I should see "It needs an input source."
    And I should see "Start with"

  Scenario: Chain without an input source or audio file
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have not added an input source to "Awesome Guitar"
    And I have not added an audio file to "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    Then I should see "This chain is incomplete."
    And I should see "It needs an input source."
    And I should see "It needs a preamp."
    And I should see "It needs an audio file"
    And I should see "Start with"

  Scenario: Chain without a preamp
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have not added a preamp to "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    Then I should see "This chain is incomplete."
    And I should see "It needs a preamp."
    And I should see "Start with"

  Scenario: Drafts not viewable by public
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have not added an input source to "Awesome Guitar"
    When I go to the chains index page
    Then I should not see "Awesome Guitar"

  Scenario: Complete chains viewable by public
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added an input source to "Awesome Guitar"
    And I have added a preamp to "Awesome Guitar"
    And I have added an audio file to "Awesome Guitar"
    When I go to the chains index page
    Then I should see "Awesome Guitar"

  Scenario: Complete chains have no completion message
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added an input source to "Awesome Guitar"
    And I have added a preamp to "Awesome Guitar"
    And I have added an audio file to "Awesome Guitar"
    When I view the chain named "Awesome Guitar"
    Then I should not see "This chain is incomplete."

  Scenario: Chain without input source not viewable by public
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added a preamp to "Awesome Guitar"
    And I have added an audio file to "Awesome Guitar"
    When I go to the chains index page
    Then I should not see "Awesome Guitar"

  Scenario: Chain without preamp not viewable by public
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added an input source to "Awesome Guitar"
    And I have added an audio file to "Awesome Guitar"
    When I go to the chains index page
    Then I should not see "Awesome Guitar"

  Scenario: Chain without audio file not viewable by public
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added an input source to "Awesome Guitar"
    And I have added a preamp to "Awesome Guitar"
    When I go to the chains index page
    Then I should not see "Awesome Guitar"

  Scenario: Adding other gear before an input source
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added a dynamics processor to "Awesome Guitar"
    When I add an input source to "Awesome Guitar"
    And I view the chain named "Awesome Guitar"
    Then I should see the input source first
    And I should see the "dynamics processor" second

  Scenario: Adding a preamp and other gear before an input source
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome Guitar"
    And I have added a dynamics processor to "Awesome Guitar"
    And I have added a preamp to "Awesome Guitar"
    When I add an input source to "Awesome Guitar"
    And I view the chain named "Awesome Guitar"
    Then I should see the input source first
    And I should see the "preamp" second
    And I should see the "dynamics processor" third
