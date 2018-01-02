class Store
  attr_reader :name, :city, :distance, :phone, :store_type

  def initialize(attrs = {})
    @name = attrs[:name]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @store_type = attrs[:storeType]
  end

  def self.all_by_zipcode(zip)
    best_buy_service.all_by_zipcode(zip)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  def self.total_stores(zip)
    best_buy_service.all_by_zipcode(zip)[:total]
  end

  private

  def self.best_buy_service
    @best_buy_service ||= BestBuyService.new
  end

end