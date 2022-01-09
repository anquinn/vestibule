class Announcement < ApplicationRecord
	translates :title, :body
	after_commit :send_notification, on: :create

	validates :title_en, :title_fr, :body_en, :body_fr, presence: true

	def send_notification
		if Rails.env.development?
			AnnouncementNotification.with(announcement: self).deliver_later(User.first)
		else
			AnnouncementNotification.with(announcement: self).deliver_later(User.all)
		end
	end
end
