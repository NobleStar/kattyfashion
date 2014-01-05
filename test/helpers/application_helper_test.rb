# coding: utf-8
require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper
  test "that transliteration works" do
    str = "привет"
    assert transliterate(str).eql? 'privet'
  end
end