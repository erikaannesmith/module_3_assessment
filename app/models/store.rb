class Store
  attr_reader :name, :city, :distance, :phone, :store_type

  def initialize(attrs = {})
    @name = attrs[:name]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @store_type = attrs[:storeType]
  end

end