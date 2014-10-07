class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    unless current_user.stripe_customer_id?

      customer = Stripe::Customer.create(
        :email => current_user.email,
        :card  => params[:stripeToken]
      )

      current_user.stripe_customer_id=customer.id
    
    end

    charge = Stripe::Charge.create(
      :customer    => current_user.stripe_customer_id,
      :amount      => @amount,
      :description => 'Payment for photo',
      :currency    => 'gbp'
    )

    current_user.save

    flash[:notice] = "Thanks for your purchase!"
    redirect_to posts_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
