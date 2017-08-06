class OrdersController < ApplicationController
  def create
    @order = Order.new order_params
    @order.line_items = get_cart.line_items

    if @order.save
      flash[:success] = "Thanks! Come again"
      destroy_cart
    else
      flash[:error] = @order.errors.full_messages.to_sentence
    end

    redirect_to menu_path
  end

  
  private
  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end
end
