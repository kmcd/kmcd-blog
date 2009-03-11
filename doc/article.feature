Feature: Publishing an article
   In order to save time creating blog posts and increase 
   I should be able to quickly create and publish a text file
   
   Scenario: Author creates a new blank article [DONE]
      Given that he's working in a text editor and command line
      When  he wants to create an article
      When  he runs a generator to create a template article
      Then  a file with the article name should be created
      And   the article title should be at the top of the template
   
   Scenario: Author publishes an article
      Given that he's working in a text editor and command line
      And   he's writing in textile
      When  he's finished writing
      Then  he should publish to the article online with one command
      
   Scenario: Article url
      Given that the article is published
      Then  the url should be an underscored slug of the title
      
   Scenario: Reader reads article
      Given that he's not logged in
      When  on an article page
      Then  he should see syntax highlighted code
