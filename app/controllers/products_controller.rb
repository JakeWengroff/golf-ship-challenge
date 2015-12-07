class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if (@product.type == "Golf") && (56 >= @product.length > 52)
      @product.name = "Extra Large Package"
    elsif (@product.type == "Golf") && (52 >= @product.length > 48)
      @product.name = "Large Package"

    elsif (@product.type == "Luggage") && (41 >= @product.length > 26)
      @product.name = "Oversized Bag"
    elsif (@product.type == "Luggage") && (22 >= @product.height > 7)
      @product.name = "Checked Bag"

    elsif (@product.type == "Ski") && (10 >= @product.width >= 8) && (40 >= @product.weight > 25)
      @product.name = "Double Ski Bag"
    elsif (@product.type == "Ski") && (@product.width == 14) && (40 >= @product.weight > 25)
      @product.name = "Double Snowboard Bag"
    end

    @product.save
      redirect_to products_path, notice: "The product has been created!" and return
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
