require 'test_helper'

module HighVoltage
  class PagesControllerTest < ActionController::TestCase
    %w(home contato).each do |page|
      test "should get #{page}" do
        get :show, id: page
        assert_response :success
        assert_template page
      end
    end
  end
end
