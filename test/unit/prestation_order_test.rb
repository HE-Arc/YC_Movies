require 'test_helper'

class PrestationOrderTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PrestationOrder.new.valid?
  end
end
