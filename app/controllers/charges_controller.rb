class ChargesController < ApplicationController
  def new
  end

def create
  # Amount in cents
  @amount = params[:price]

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  Stripe.api_key = ENV["stripe_secret"]

  charge = Stripe::Charge.create({
    :amount => @amount,
    :currency => "usd",
    :source => "tok_visa",#params[:stripeToken],
    :destination => {
      :account => params[:publishable_key],
    }
  })#availability_id:params[:avail].to_i, method: :create
   redirect_to book_it_path(availability_id: params[:avail])

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
