require 'csv'

user = User.find_or_create_by(email: "aquinn@datasciences.ca") do |user|
	user.password = "Password!2"
	user.first_name = "Andrew"
	user.last_name = "Quinn"
	user.title = "DS Admin"
	user.user_type = "admin"
end

if Riding.all.size == 0
	CSV.foreach(Rails.root.join('lib/seeds/lpc_ridings.csv'), headers: true) do |row|
		Riding.find_or_create_by(riding_code: row["riding_code"]) do |riding|
			riding.name_en = row["riding_name_en"]
			riding.name_fr = row["riding_name_fr"]
		end
	end
end

if ExternalReport.all.size == 0
	CSV.foreach(Rails.root.join('lib/seeds/reports.csv'), headers: true) do |row|
		ExternalReport.find_or_create_by(name_en: row["report_en"]) do |report|
			report.name_en = row["report_en"]
			report.name_fr = row["report_fr"]
			report.description_en = row["description_en"]
			report.description_fr = row["description_fr"]
		end
	end
end

if UserPermission.all.size == 0
	CSV.foreach(Rails.root.join('lib/seeds/reports.csv'), headers: true) do |row|
		UserPermission.find_or_create_by(name: row["report_en"]) do |permission|
			permission.name = row["report_en"]
		end

		UserPermission.find_or_create_by(name: "System - Create Users") do |permission|
			permission.name = "Create Users"
		end

		UserPermission.find_or_create_by(name: "System - Field Organizer") do |permission|
			permission.name = "Field Organizer"
		end

		UserPermission.find_or_create_by(name: "System - Create Announcements") do |permission|
			permission.name = "Create Announcements"
		end

	end
end


Rake::Task["update_ridings:update_email_plans"].invoke

Rake::Task["update_ridings:update_suggested_email_plan_sizes"].invoke

Rake::Task["update_ridings:update_mps"].invoke

Rake::Task["update_ridings:update_riding_external_report_links"].invoke
