require "minitest/autorun"
require 'matcher'

class MatcherTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_ignore_surrounding_white_space_before
    expected = %w[Julia]
    filter = " Jul"
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_accept_exact_match_for_two_character
    db_users = %w(Literal Li Lia)
    user = User.new(db_users)
    expected = %w[Li]
    filter = "Li"
    result = user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_surrounding_white_space_after
    expected = %w[Julia]
    filter = "Jul "
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_surrounding_white_space_both
    expected = %w[Julia]
    filter = " Jul "
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_ignore_more_than_three_characters
    expected = []
    filter = "Julius"
    result = @user.filter(filter)

    assert_equal expected, result
  end

  def test_reject_match_on_one_characters
    db_users = %w(Literal Li Lia Jones)
    user = User.new(db_users)
    expected = []
    filter = "L"
    result = user.filter(filter)

    assert_equal expected, result
  end

  def test_reject_match_on_two_characters
    db_users = %w(Literal Li Lia Jones)
    user = User.new(db_users)
    expected = []
    filter = "Jo"
    result = user.filter(filter)

    assert_equal expected, result
  end
end