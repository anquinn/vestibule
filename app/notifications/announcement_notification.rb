# To deliver this notification:
#
# AnnouncementNotification.with(announcement: @announcement).deliver_later(current_user)
# AnnouncementNotification.with(announcement: @announcement).deliver(current_user)

class AnnouncementNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "AnnouncementMailer", method: :new_announcement

  # Add required params
  # 
  param :announcement

  # Define helper methods to make rendering easier.
  #
  def title
    params[:announcement].title
  end

  def message
    params[:announcement].body
  end
  #
  def url
    announcement_path(params[:announcement])
  end

  def format_for_email
    first_name = recipient.first_name
    subject = params[:announcement].title
    content = params[:announcement].body
    email = recipient.email
  end

end
