class StoreSearchService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def stores
    best_buy_service.all_by_zipcode(zip)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  def store_count
    best_buy_service.all_by_zipcode(zip)[:total]
  end

  def best_buy_service
    @best_buy_service ||= BestBuyService.new
  end

end