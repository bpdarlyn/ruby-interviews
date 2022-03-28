require "minitest/autorun"
require 'matcher/helpers'

class MatcherTest < Minitest::Test
  include Filters

  def test_raise_on_more_than_three_character
    characters = 'csfa'
    assert_raises(ExceptionFilters) {filter_only_three_character_length(characters)}
  end

  def test_no_raise_on_three_character
    characters = 'jona'
    assert_raises(ExceptionFilters) {filter_only_three_character_length(characters)}
  end

  def test_validator_min_of_character
    characters = 'l'
    assert_raises(ExceptionFilters) {filter_validator_range_of_character(characters)}
  end

  def test_validator_max_of_character
    characters = 'lsdd'
    assert_raises(ExceptionFilters) {filter_validator_range_of_character(characters)}
  end

  def test_validator_no_raise_length_of_character
    characters = 'la'
    expected = nil
    result = filter_validator_range_of_character characters
    assert_nil expected, result
  end

  def test_apply_filter_upcase
    query = 'Jul'
    users = %w[Julia Jones]
    expected = %w[Julia]
    result = apply_filter(query, users)
    assert_equal expected, result
  end

  def test_apply_filter_lowercase
    query = 'jul'
    users = %w[Julia Jones Jul JU]
    expected = %w[Julia Jul]
    result = apply_filter(query, users)
    assert_equal expected, result
  end

  def test_filter_equal_length
    query = 'Li'
    results = %w[Julia Jones Jul Li literal Lia]
    expected = %w[Li]
    result = apply_rule_equal_length(query, results)
    assert_equal expected, result
  end



end