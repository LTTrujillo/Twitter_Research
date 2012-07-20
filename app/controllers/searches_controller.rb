class SearchesController < ApplicationController

  def index
  end

  def show
  #debugger
  search = SimpleTwitter:: Search.new
  @results = search.search(params[:q])
  end

end
