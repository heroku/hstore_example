class ProductsController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :update, :edit]


  def index
    @products  = current_user.products
  end
  
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end
  

  def update
    @product = current_user.products.find(params[:id])
    @product.update_attributes(params[:product])
    redirect_to @product
  end
  
  def edit
    @product = current_user.products.find(params[:id])
  end
  
  def create
    @product = current_user.products.create(params[:product])
    redirect_to @product
  end
end
