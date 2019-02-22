class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: "Your Order##{@order.id} Has Been Received!")
  end
end
