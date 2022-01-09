# frozen_string_literal: true

class AnnouncementPolicy < ApplicationPolicy

  def index?
    user
  end

  def show?
    user
  end

  def create?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Announcements"))
  end

  def new?
    create?
  end

  def update?
    user.admin? || (user.user_permissions.exists?(name: "System - Create Announcements"))
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
