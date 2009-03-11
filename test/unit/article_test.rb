require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  TITLE = 'Syntax sugar for test unit'
  
  def setup
    @test_unit_syntax_sugar = Article.create!(:title => TITLE)
  end
  
  test "should have a title" do
    assert_equal TITLE, @test_unit_syntax_sugar.title
  end
  
  test "should NOT have an empty title" do
    assert_raise ActiveRecord::RecordInvalid do
      @test_unit_syntax_sugar.update_attributes! :title => ''
    end
  end
  
  test "should NOT have duplicate titles" do
    assert_raise ActiveRecord::RecordInvalid do
      Article.create!(:title => TITLE)
    end
  end
end
