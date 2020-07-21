class TagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        scope.where(user_id: user.id).all
      end
    end
  end

  def index?
    user.present?
  end
  
  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == Tag.user
  end

  def destroy?
    return true if user.present? && user == Tag.user
  end

  private
  def highlight
    record
  end
end