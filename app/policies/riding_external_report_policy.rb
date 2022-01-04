# frozen_string_literal: true

class RidingExternalReportPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show?
    false
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
        RidingExternalReport.where(riding: user.ridings)
      end
    end

    private

    attr_reader :user, :scope
  end
end
