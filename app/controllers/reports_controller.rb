class ReportsController < ApplicationController
  def index
    # authorize :report, :index?
    @riding_reports = policy_scope(RidingExternalReport)
    authorize :report, :index?
  end

  def field_organizer
    @ridings = policy_scope(Riding).reorder(sort_column => sort_direction)
    authorize :report, :field_organizer?
  end

  def regional_field
    @ridings ||= Riding.all.reorder(sort_column => sort_direction)
    authorize :report, :field_organizer?
  end

  def sort_column
    %w{ riding_code name_en riding.email_plan.status }.include?(params[:sort]) ? params[:sort] : "riding_code"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end

end
