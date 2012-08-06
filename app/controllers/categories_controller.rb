class CategoriesController < ApplicationController

  def index #show a list of all categories
    @categories = Category.order(:title).limit(50)
    respond_with(@category)
  end

  def show #show a single category with all of it's tweets'
    @category = Category.includes(:tweets).order('tweets.tweeted_at desc').
      find(params[:id])
    respond_with(@category)
  end

  def new #show form for a new category
    @category = Category.new
    respond_with(@category)
  end

  def create #actually create the category
    @category = Category.create(params[:category])
    flash.notice "You created a category" if !category.new_record?
    respond_with(@category, location: categories_url)
  end

  def edit #show a form to let a user edit a category
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  def update #update the category after the form has been submitted
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category)

  end

  def destroy #delete a category
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(@category)
  end
end


