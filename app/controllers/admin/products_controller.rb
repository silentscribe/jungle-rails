class Admin::ProductsController < ApplicationController
  before_filter :http_basic_auth

  def http_basic_auth
    if ENV['HTTP_AUTH'] =~ %r{(.+)\:(.+)}
      unless authenticate_with_http_basic { |user, password|  user == $1 && password == $2 }
        request_http_basic_authentication
      end
    end
  end

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
