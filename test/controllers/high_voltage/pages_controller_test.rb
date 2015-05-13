require 'test_helper'

class HighVoltage::PagesControllerTest < ActionController::TestCase

  %w(contato).each do |page|
    test "should get #{page}" do
      get :show, id: page
      assert_response :success
      assert_template page
    end
  end

end
