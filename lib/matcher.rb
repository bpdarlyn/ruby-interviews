require 'matcher/helpers'

DATABASE_NAMES = %w[Julia Li Shonda]
#
class User
  include Filters
  def initialize
    super
  end


  def filter(query)
    strip_query = query.strip
    begin
      filter_only_three_character(strip_query)
    rescue ExceptionFilters
      nil
    end
  end
end