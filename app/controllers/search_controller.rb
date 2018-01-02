class SearchController < ApplicationController

  def index
    @storesearch = StoreSearchService.new(params[:zipcode])
  end

end