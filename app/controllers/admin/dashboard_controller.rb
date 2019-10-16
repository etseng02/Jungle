class Admin::DashboardController < ApplicationController

  include HttpAuthConcern

  def show
    @products = Product.order("id")
    @categories = Category.order("id")
  end
end
