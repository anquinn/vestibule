# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  
  def index?
    user.admin? || user.user_permissions.exists?(name: "System - Create Users")
  end

  def show?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Users") && record.user_type != "admin")
  end

  def create?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Users") && record.user_type != "admin")
  end

  def new?
    create?
  end

  def update?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Users") && record.user_type != "admin")
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def impersonate?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Users") && record.user_type != "admin")
  end

  def stop_impersonating?
    true
  end


  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        scope.where.not(user_type: "admin")
      end
    end

    private

    attr_reader :user, :scope
  end
end
