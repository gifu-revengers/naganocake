class Public::CartItemsController < ApplicationController

  def index
    @cart_items=CartItem.where(customer_id: current_customer)
    @cart_item=CartItem.new
  end

  def create
  end

  def update
    @cart_items=CartItem.where(customer_id: current_customer)
    @cart_item=CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render "index"
    end

  end

  def destroy
    @cart_items=CartItem.where(customer_id: current_customer)
    @cart_item=CartItem.new
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
  end

  def destroy_all
    @cart_items=CartItem.where(customer_id: current_customer)
    @cart_item=CartItem.new
    cart_items=CartItem.where(customer_id: current_customer)
    cart_items.each do |cart_item|
      cart_item.destroy
    end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
