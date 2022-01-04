namespace :update_ridings do
require 'csv'

  desc "Update riding email plans"
  task :update_email_plans => :environment do |t, args|

    s3 = Aws::S3::Resource.new(
      region: 'ca-central-1',
      access_key_id: Rails.application.credentials.aws[:access_key_id],
      secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    )

    s3.bucket('ds-portal-storage').object("email_plans_lpc.csv").get(response_target: './tmp/email_plans_lpc.csv')
 
    # file name in lib/seeds dir
    file_name = "email_plans_lpc.csv"
    riding_count = 0

    puts "running..."

    EmailPlan.update_all(status: :inactive, start_date: nil, end_date: nil, size: nil)
    
    CSV.foreach(Rails.root.join("tmp/#{file_name}"), headers: true) do |row|
      riding_count +=1

      riding = Riding.find_by(riding_code: row["riding_code"].to_i)

      puts riding.name_en

      if riding.email_plan.present?
        email_plan = riding.email_plan
      else
        email_plan = EmailPlan.create(riding: riding)
      end

      email_plan.update(status: :active, start_date: row["start_date"].to_datetime, end_date: row["end_date"].to_datetime, size: row["size"].to_i)
    end

    puts "#{riding_count} email plans updated."
  end


  desc "Update riding suggested email plan sizes"
  task :update_suggested_email_plan_sizes => :environment do |t, args|

    s3 = Aws::S3::Resource.new(
      region: 'ca-central-1',
      access_key_id: Rails.application.credentials.aws[:access_key_id],
      secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    )

    s3.bucket('ds-portal-storage').object("lpc_van_email_subscribed_count_000").get(response_target: './tmp/email_plan_sizes.csv')
 
    # file name in lib/seeds dir
    file_name = "email_plan_sizes.csv"
    riding_count = 0

    puts "running..."
    
    CSV.foreach(Rails.root.join("tmp/#{file_name}"), headers: true) do |row|
      riding_count +=1

      riding = Riding.find_by(riding_code: row["riding_code"].to_i)

      if riding.email_plan.present?
        email_plan = riding.email_plan
      else
        email_plan = EmailPlan.create(riding: riding)
      end

      email_plan.update(suggested_list_size: row["default_email_list_size"].to_i, current_subscribes: row["subscribed_email_count"].to_i)
    end

    puts "#{riding_count} email plans updated."
  end

  desc "Update MPs"
  task :update_mps, [:store_id] => :environment do |t, args|

    riding_count = 0

    # pull current members from HoC EN
    CSV.foreach(open("https://www.ourcommons.ca/Members/en/search/csv?caucusId=all&province=all&gender=all"), headers: true) do |row|
      riding_count +=1

      riding = Riding.find_by(name_en: row["Constituency"].gsub("—", "-"))

      puts riding_count
      puts riding.name 
      puts "\n"

      riding.update({
        member_affiliation_en: row["Political Affiliation"],
        member_name_en: "#{row['First Name']} #{row["Last Name"]}",
      })
    end

    # pull current members from HoC FR
    CSV.foreach(open("https://www.noscommunes.ca/members/fr/search/csv"), headers: true) do |row|
      riding_count +=1

      riding = Riding.find_by(name_fr: row["Circonscription"].gsub("—", "-"))

      puts riding_count
      puts riding.name 
      puts "\n"

      riding.update({
        member_affiliation_fr: row["Affiliation politique"],
        member_name_fr: "#{row['Prénom']} #{row["Nom de famille"]}",
      })
    end

    puts "#{riding_count} MPs updated."
  end

  desc "Update riding external report links"
  task :update_riding_external_report_links => :environment do |t, args|

    # file name in lib/seeds dir
    file_name = "lpc_reports.csv"
    # set based on the number of columsn in the file
    column_count = 5
    reports_count = 0

    puts "running..."
    
    CSV.foreach(Rails.root.join("lib/seeds/#{file_name}"), headers: true) do |row|
      reports_count +=1

      riding = Riding.find_by(riding_code: row["Fednum"].to_i)

      report = RidingExternalReport.find_or_initialize_by(riding: riding, external_report: ExternalReport.find_by(name_en: "EDA - Fundraising Report"))
      report.link = row[1]
      report.save

      report = RidingExternalReport.find_or_initialize_by(riding: riding, external_report: ExternalReport.find_by(name_en: "EDA - Financial Report"))
      report.link = row[2]
      report.save

      report = RidingExternalReport.find_or_initialize_by(riding: riding, external_report: ExternalReport.find_by(name_en: "EDA - Daily Notification"))
      report.link = row[3]
      report.save

      report = RidingExternalReport.find_or_initialize_by(riding: riding, external_report: ExternalReport.find_by(name_en: "EDA - Dashboard"))
      report.link = row[4]
      report.save
    end

    puts "#{reports_count} ridings updated."
  end


end