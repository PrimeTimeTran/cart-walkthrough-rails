class CartsController < ApplicationController
  def add
    cart = get_cart
    cart.consolidate_items(line_item_params)
    
    redirect_back(fallback_location: menu_path)
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end

  private
  def line_item_params
    params.require(:line_item).permit(:food_item_id, :quantity)
  end
end
