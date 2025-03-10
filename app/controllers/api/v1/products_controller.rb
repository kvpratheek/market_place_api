class Api::V1::ProductsController < ApplicationController
  before_action(:check_login, only: %i[ show index create])
  before_action :set_product, only: %i[show ]
  def index
    # render(json: Product.all)
    render json: Product.all.map { |prod| ProductSerializer.new(prod).serializable_hash }.to_json
    # render json: ProductSerializer.new(Product.all).serializable_hash.to_json
  end

  def show
    # render(json: Product.find(params[:id]))
    render json: ProductSerializer.new(@product).serializable_hash.to_json
  end

  def create
    product = current_user.products.build(product_params)
    if product.save
      render json: ProductSerializer.new(product).serializable_hash.to_json, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end

  def check_login
    head :forbidden unless get_current_user
  end

  def set_product
    @product = Product.find(params[:id])
  end
end