class DriftWavePolicy < ApplicationPolicy
    def index?
        true
    end
    class Scope < Scope
        def resolve
        scope
        end
    end

    def show?
        true
    end
end
  