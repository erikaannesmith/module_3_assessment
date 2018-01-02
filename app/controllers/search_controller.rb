class SearchController < ApplicationController

  def index
    @stores = Store.all_by_zipcode(params[:zipcode])
    @stores_count = Store.total_stores(params[:zipcode])
  end

end