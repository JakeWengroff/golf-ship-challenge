class Api::ProductsController < Api::ApiController
  def index
    render json: Product.all
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render status: 200, json: {
        message: "Successfully created Product.",
        product: @product
      }.to_json
    else
      render status: 422, json: {
        errors: @product.errors
      }.to_json
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render status: 200, json: {
        message: "Successfully updated Product.",
        product: @product
      }.to_json
    else
      render status: 422, json: {
        errors: @product.errors
      }.to_json
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render status: 200, json: {
      message: "Successfully deleted Product."
    }.to_json
  end

  private
  def product_params
    params.require("product").permit("name")
  end
end
