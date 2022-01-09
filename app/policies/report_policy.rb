# frozen_string_literal: true

class ReportPolicy < Struct.new(:user, :report)
  
  def index?
    user.admin? or field_organizer? or RidingExternalReportPolicy::Scope.new(user, nil).resolve.any?
  end

  def show_internal_reports?
    user.admin? or field_organizer?
  end

  def field_organizer?
    user.admin? or user.user_permissions.exists?(name: "System - Field Organizer")
  end
end
