require 'matcher/helpers'

DATABASE_NAMES = %w[Julia Li Shonda]
#
class User
  def initialize
    super
  end

  def filter(query)
    "Julia"
  end
end