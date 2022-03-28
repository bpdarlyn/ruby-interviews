class ExceptionFilters < StandardError
  def initialize(msg = nil)
    super(msg)
  end
end

module Filters
  def filter_only_three_character_length(c)
    if c.length > 3
      raise ExceptionFilters.new('we accept only 3 characters as max')
    end
  end

  def filter_validator_range_of_character(c)
    unless c.length <= 3 and c.length >= 2
      raise ExceptionFilters.new('the character length should be between 2 and 3')
    end
  end

  def apply_filter(query, users)
    # /i is case sensitive
    users.grep(/#{query}/i)
  end

  def apply_rule_equal_length(query, results = [])
    results.filter{|r| r.length == query.length}
  end
end