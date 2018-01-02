class BestBuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def all_by_zipcode(zip)
    get_json("/v1/stores(area(80203,25))?format=json&show=storeId,storeType,name&apiKey=ru99w3xp6qu5848qvbgrznxq")
  end

  def get_json(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end