class Payment < ActiveRecord::Base
	belongs_to :user

	def self.paypal_url(return_url)
		values = {
		:business => 'vinod-facilitator@codingmart.com',
		:cmd => '_cart',
		:upload => 1,
		:return => return_url,
		:token => "ShGdfMmasQQXQjDZYOQ6rWJxZpyGsXWuULWN1ZckwzCGEaJkIQ8bW_UdUum",
		#:amount_1 => "9",
		:item_name_1 => "Video Car Post",
		:item_number_1 => "1",
		:quantity_1 => '1'
		}
		# This is a paypal sandbox url and should be changed for production.
		"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
		end
end
