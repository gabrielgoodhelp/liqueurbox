class OrderMailer < ActionMailer::Base
  default from: "liqueurbox.co"

  	def order_successful(order)
		@order = order
		@url = 'http://www.liqueurbox.herokuapp.com/admin'
		mail(to: 'gabriele.buonaiuto@gmail.com', subject: 'Successful Order')
	end
end
