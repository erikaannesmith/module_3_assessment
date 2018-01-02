class SearchController < ApplicationController

  def index
    @stores = Store.all_by_zipcode(params[:zipcode])
  end

end