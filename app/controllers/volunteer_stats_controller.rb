class VolunteerStatsController < ApplicationController
  before_action :set_riding

  def current
    respond_to do |format|
      format.html { render partial: 'ridings/volunteer/current' }
    end
  end

  def yesterday
    respond_to do |format|
      format.html { render partial: 'ridings/volunteer/yesterday' }
    end
  end

  def last_7
    respond_to do |format|
      format.html { render partial: 'ridings/volunteer/last_7' }
    end
  end

  def last_30
    respond_to do |format|
      format.html { render partial: 'ridings/volunteer/last_30' }
    end
  end

  private

  def set_riding
    @riding = Riding.friendly.find(params[:riding_id])
  end
end