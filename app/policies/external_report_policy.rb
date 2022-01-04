# frozen_string_literal: true

class ExternalReportPolicy < ApplicationPolicy

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
end
