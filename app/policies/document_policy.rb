class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        scope.where(user_id: user.id).all
      end
    end
  end

  def index?
    true
  end
  
  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == document.user
  end

  def destroy?
    return true if user.present? && user == document.user
  end

  private
  def document
    record
  end
end