require 'test_helper'

class TwitterIdTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TwitterId.new.valid?
  end
end
