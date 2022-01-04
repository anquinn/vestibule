# frozen_string_literal: true

class UserPermissionPolicy < ApplicationPolicy
  
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        # user.party.user_permissions #only the permissions associated party
      end
    end

    private

    attr_reader :user, :scope
  end
end
