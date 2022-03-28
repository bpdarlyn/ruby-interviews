require 'matcher/helpers'

DATABASE_NAMES = %w[Julia Li Shonda]
#
class User
  include Filters
  attr_reader :users
  def initialize(default_users=nil)
    @users = default_users if default_users
    @users ||= DATABASE_NAMES
  end


  def filter(query)
    # remove trailing spaces
    strip_query = query.strip
    begin
      # Validator
      filter_validator_range_of_character(strip_query)

      # Apply filter
      results = apply_filter(strip_query, self.users)
      if strip_query.length == 2
        apply_rule_equal_length(strip_query, results)
      else
        results
      end
    rescue ExceptionFilters
      []
    end
  end
end