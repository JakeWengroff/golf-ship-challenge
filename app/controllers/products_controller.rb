class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "The product has been created!" and return
    end
    render 'new'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path, notice: "The #{name} for #{type} has been updated." and return
    end
    render 'edit'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "The #{name} for #{type} has been deleted." and return
  end

private
  def product_params
    params.require(:product).permit(:name, :type, :length, :width, :height, :weight)
  end
end
