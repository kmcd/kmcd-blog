Feature: Home page
   In order to browse all content quickly
   A Reader should see all links & summaries of all my articles
   
   Scenario: Reader views all articles
      When    on the home page
      Then    all articles should be shown in reverse chronological order
      
   Scenario: Reader views summary
      When    on the home page
      Then    a brief summary, contact details and a photo should be shown
