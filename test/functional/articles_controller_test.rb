require 'test_helper'

class ArticlesControllerShowTest < ActionController::TestCase
  tests ArticlesController
  include ArticlesFunctionalHelper
  
  test "should have REST show route" do
    assert_routing article_path(@writing_a_generator),
      { :controller => "articles", :action => "show", :id => @writing_a_generator.to_param } 
  end
  
  test "should find article based on title slug" do
    show @writing_a_generator
    assert_match /#{@writing_a_generator.title}/i , assigns(:article).title
  end
  
  test "should render the article page" do
    show @writing_a_generator
    assert_response :success
    assert_template 'show'
  end
  
  test "should have a route for /articles/article_title.html" do
    
  end
end
