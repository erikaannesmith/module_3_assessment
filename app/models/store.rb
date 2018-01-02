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
    BestBuyService.new.all_by_zipcode(zip).map do |raw_store|
      Store.new(raw_store)
    end
  end

# refactor to extract new service in line 4
end