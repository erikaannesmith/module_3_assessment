class BestBuyService

  def initialize
    @conn = Faraday.new(url: "") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def all_by_zipcode(zip)
    get_json("")
  end

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end