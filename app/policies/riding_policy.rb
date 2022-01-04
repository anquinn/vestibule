# frozen_string_literal: true

class RidingPolicy < ApplicationPolicy
  
  def index?
    user
  end

  def show?
    user.admin? or user.ridings.include? (record)
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        user.ridings #only the ridings associated with that user
      end
    end

    private

    attr_reader :user, :scope
  end
end
