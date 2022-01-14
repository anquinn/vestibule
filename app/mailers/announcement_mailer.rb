class AnnouncementMailer < ApplicationMailer
	def new_announcement
        @first_name = params[:recipient].first_name
        @subject = params[:announcement].title
        @content = params[:announcement].body
        @email = params[:recipient].email

        I18n.with_locale(params[:recipient].preferred_language) do
        	mail(to: @email, from: "Liberalist Helpdesk <campaign@liberal.ca>", subject: @subject)
        end
	end
end