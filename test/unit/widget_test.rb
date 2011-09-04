require 'test_helper'

class WidgetTest < Test::Unit::TestCase
  load_schema

  def test_fixtures_are_working
    assert_equal framey_widget(:first).title, "This is the title"
  end
  
    
end
