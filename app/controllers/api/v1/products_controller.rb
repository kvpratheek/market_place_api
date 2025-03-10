class Api::V1::ProductsController < ApplicationController
  before_action(:check_login, only: %i[ show index create])
  def index
    render(json: Product.all)
  end

  def show
    render(json: Product.find(params[:id]))
  end

  def create
    product = current_user.products.build(product_params)
    if product.save
      render json: product, status: :created
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
end