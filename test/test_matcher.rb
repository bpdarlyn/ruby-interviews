require "minitest/autorun"
require 'matcher'

class MatcherTest < Minitest::Test
  def setup
    @user = User.new
  end
  def test_match_user_names
    expected = %w[Julia Li Shonda]
    result = DATABASE_NAMES
    assert_equal(expected, result)
  end

  def test_ignore_surrounding_white_space_before
    expected = "Julia"
    filter = " Jul"
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_surrounding_white_space_after
    expected = "Julia"
    filter = "Jul "
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_surrounding_white_space_both
    expected = "Julia"
    filter = " Jul "
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_more_than_three_characters
    expected = nil
    filter = "Julius"
    result = @user.filter(filter)

    assert_equal expected, result
  end
end