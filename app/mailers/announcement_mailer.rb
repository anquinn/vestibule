class AnnouncementMailer < ApplicationMailer
	def new_announcement
        @first_name = params[:recipient].first_name
        @subject = params[:announcement].title
        @content = params[:announcement].body
        mail(to: params[:recipient].email, from: "Liberalist Helpdesk <campaign@liberal.ca>", subject: @subject)
	end
end