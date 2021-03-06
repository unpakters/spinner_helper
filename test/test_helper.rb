require 'wist'
require 'capybara'
require 'pry'
require "minitest/autorun"

class CapybaraTestCase < MiniTest::Unit::TestCase
  include Capybara::DSL
  include Wist

  def setup
    Capybara.current_driver = :chrome
  end

  def teardown
    Capybara.reset_sessions!
  end
end