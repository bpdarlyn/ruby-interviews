require "minitest/autorun"
require 'matcher/helpers'

class MatcherTest < Minitest::Test
  include Filters

  def test_raise_on_more_than_three_character
    characters = 'csfa'
    assert_raises(ExceptionFilters) {filter_only_three_character(characters)}
  end

  def test_no_raise_on_three_character
    characters = 'jon'
    assert_raises(ExceptionFilters) {filter_only_three_character(characters)}
  end





end