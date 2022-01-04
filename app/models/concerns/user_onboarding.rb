module UserOnboarding
  extend ActiveSupport::Concern

  def should_see_onboarding?
    if onboarding_completed_at?
      return false
    else
      update(onboarding_completed_at: Time.current)
      return true
    end
  end

  # def should_see_welcome?
  #   created_at > 30.seconds.ago
  # end

  # def onboarding_percent
  #   return 100 if onboarding_completed_at?

  #   # steps = [:has_quiz?, :has_room?, :has_hosted?]
  #   # complete = steps.select{ |step| send(step) }
  #   # percent = complete.length / steps.length.to_f * 100
  #   percent = 100
  #   update(onboarding_completed_at: Time.current) if percent == 100
  #   percent
  # end
end