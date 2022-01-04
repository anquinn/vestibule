module ReportHelper
	def color_range(number)
		case number
		when 0
			bg = "bg-white text-gray-500 dark:bg-dark-gray-800 dark:text-dark-gray-300"
		when 1..5
			bg = "bg-green-50 text-gray-500 dark:bg-green-600 dark:text-dark-gray-300"
		when 6..10
			bg = "bg-green-200 text-gray-500 dark:bg-green-700 dark:text-dark-gray-300"
		when 11..15
			bg = "bg-green-300 text-green-50 dark:bg-green-800 dark:text-dark-gray-300"
		else
			bg = "bg-green-400 text-green-50 dark:bg-green-900 dark:text-dark-gray-300"
		end

		return bg
	end
end
