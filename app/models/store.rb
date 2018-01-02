class Store

  def self.all_by_zipcode(zip)
    BestBuyService.new.all_by_zipcode(zip).map do |raw_store|
      Store.new(raw_store)
    end
  end

# refactor to extract new service in line 4
end