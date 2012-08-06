class SearchesController < ApplicationController

  def index
  end

  def show

    search = SimpleTwitter:: Search.new
    flash.notice = "I just did your search"
  @results = search.search(params[:q])
  end

end
