class Role < ApplicationRecord
  default_scope { order('level DESC') }
  def admin?
    self.level == 1
  end

end
