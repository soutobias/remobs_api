class DataStationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def station?
    true
  end
  def last?
    true
  end

end
