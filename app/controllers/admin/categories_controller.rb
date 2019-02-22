class Admin::CategoriesController < ApplicationController
  before_filter :http_basic_auth

  def http_basic_auth
    if ENV['HTTP_AUTH'] =~ %r{(.+)\:(.+)}
      unless authenticate_with_http_basic { |user, password|  user == $1 && password == $2 }
        request_http_basic_authentication
      end
    end
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
