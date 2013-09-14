require 'test_helper'

class SpinnerHelperTest < CapybaraTestCase
  def setup
    super
    visit "file://#{Dir.pwd}/test/test.html"
  end

  def test
    button = find('#button')
    button.click

    %w(width line-height).each do |style|
      assert_equal("100px", get_js("$('.dynamic-spinner').css('#{style}')"))
    end

    assert_equal('color: red; display: none !important;', button[:style])

    wait_until { button[:style] == 'color: red;' }
    assert_text('0', find('#output'))

    assert_has_no_css('.dynamic-spinner')
  end
end