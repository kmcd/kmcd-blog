require 'test_helper.rb'

class ArticlesViewShowTest < ActionController::TestCase
  tests ArticlesController
  include ArticlesFunctionalHelper
  
  test "should render textile article content as html" do
    show @writing_a_generator
    assert_select "p strong", "Generators"
  end
end

class ArticlesViewIndexTest < ActionController::TestCase
  tests ArticlesController
  
  def setup
    get :index
  end
  
  test "should show all articles" do
    assert_select "ol#articles li", Article.count
  end
  
  test "should link to all articles" do
    # TODO: pending
    # assert_select "ol#articles li:first-child a", 'foo'
  end
end
