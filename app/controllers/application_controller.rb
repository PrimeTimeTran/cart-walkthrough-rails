class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart # make this callable from views
  helper_method :get_cart
  
  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound 
    @cart = Cart.create!
    session[:cart_id] = @cart.id
  end

  # Only call by get_cart
  def set_cart
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end

  # Called by child controller or view
  def get_cart
    return @cart if @cart
    
    if session[:cart_id]
      @cart = Cart.find session[:cart_id]
    else
      set_cart
    end
  end

  def destroy_cart
    session[:cart_id] = nil
  end
end
