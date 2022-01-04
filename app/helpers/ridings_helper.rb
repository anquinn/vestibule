module RidingsHelper
	def suggested_email_plan_size(riding)
		if riding.email_plan.present?
			pipeline_size = riding.email_plan.suggested_list_size

			case
			when pipeline_size < 500
				suggested_size = 500
			when pipeline_size < 2475
				suggested_size = 2500
			when pipeline_size < 4975
				suggested_size = 5000
			when pipeline_size < 9975
				suggested_size = 10000
			when pipeline_size < 25000
				suggested_size = 25000
			else
				suggested_size = 500
			end
		else
			suggested_size = 500
		end
		suggested_size	
	end

	def email_plan_purchase_link(riding)
		suggested_size = suggested_email_plan_size(riding)

		case suggested_size
		when 500
			link = "https://plans.liberalist.ca/collections/frontpage/products/liberalist-email-plan-1-year?variant=39415098998990"
		when 2500
			link = "https://plans.liberalist.ca/collections/frontpage/products/liberalist-email-plan-1-year?variant=39415099031758"
		when 5000
			link = "https://plans.liberalist.ca/collections/frontpage/products/liberalist-email-plan-1-year?variant=39415099064526"
		when 10000
			link = "https://plans.liberalist.ca/collections/frontpage/products/liberalist-email-plan-1-year?variant=39415099097294"
		when 25000
			link = "https://plans.liberalist.ca/collections/frontpage/products/liberalist-email-plan-1-year?variant=39415099130062"
		end

		link
	end
end
