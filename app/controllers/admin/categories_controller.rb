class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  def index
    @categories = Category.all
    # @products_count = Product.where('category_id': @categories).count
  end

  def new
    @category = Category.new
  end
end
