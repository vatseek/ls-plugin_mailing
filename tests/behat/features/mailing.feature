Feature: Mailing plugin standart features BDD
    Test base functionality of LiveStreet mailing plugin standart

@mink:selenium2
    Scenario: Sitemap LiveStreet CMS
        Given I am on "/login"
        Then I want to login as "admin"

        Then run generate unsubscribe code

        # go to create new mailing
        Given I am on "/mailing/"
        Then I fill in "subject" with "test subject"
        Then I fill in "talk_text" with "test message for users"

        Then I press element by css "input[name='submit_preview']"

        Then print last response

        Then I should see in element by css "text_preview" values:
        | value |
        | test message for users |

        Then I press element by css "input[name='submit']"

        # Go to mailing list page and check for just create mailing
        Given I am on "/mailing/list"
        Then I should see in element by css "content" values:
        | value |
        | test subject |

        Then I wait "1000"

        Then run send message script