class TradeOffer
  attr_reader :settlement,:resource_name, :amount

  def initialize(settlement, resource_name, amount)
    @settlement = settlement
    @resource_name = resource_name
    @amount = amount
  end
end