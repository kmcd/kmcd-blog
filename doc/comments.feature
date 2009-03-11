Feature: Comments
   In order to engage in discussion with readers
   So that I can get feedback on my articles
   I should be able to add, read and moderate comments
   
   Scenario: Reader posts a comment on the article
      Given that he's not logged in
      When  on an article page
      Then  he should add a comment to the page
      
   Scenario: Reader views all comments
      Given that he's not logged in 
      When  on the comments page
      Then  he should see all articles comments
      
   Scenario: Author replies to a comment
      Given that he's logged in 
      When  on the comments page
      Then  he should be able to reply to a comment
      
  Scenario: Author deletes an inappripriate comment
      Given that he's logged in  
      When  on the comments page
      And   views an inappropriate comment
      Then  he should should be able to delete that comment
