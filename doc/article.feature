Feature: Publishing an article
   In order to save time creating blog posts and increase 
   I should be able to 
   
   Scenario: Author publishes an article
      Given that he's working in a text editor and command line
      And   he's writing in textile
      When  he's finished writing
      Then  he should publish to the article online with one command
      
   Scenario: Reader reads article
      Given that he's not logged in
      When  on an article page
      Then  he should see syntax highlighted code
