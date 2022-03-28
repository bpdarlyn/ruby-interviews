class ExceptionFilters < StandardError
  def initialize(msg = nil)
    super(msg)
  end

end

module Filters
  def filter_only_three_character(c)
    if c.length > 3
      raise ExceptionFilters.new('something')
    end
  end
end