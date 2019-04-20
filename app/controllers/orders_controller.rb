class OrdersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", :only => [:edit, :new, :create, :update, :destroy]
  def show
    @order = Order.find(params[:id])
  end
  def new
    @order = Order.new
    @orders = Order.all
  end
  def edit
    @order = Order.find(params[:id])
  end
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
  private
  def order_params
    params.require(:order).permit(:title, :description, :name, :email, :phone)
  end
end