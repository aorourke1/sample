class Transaction
  attr_reader :provider_offer, :reciever_offer

  def initialize(provider_offer, reciever_offer)
    @provider_offer = provider_offer
    @reciever_offer = reciever_offer
  end

  def execute
    provider_offer.settlement.add_resource(provider_offer.resource_name, provider_offer.amount)
    provider_offer.settlement.remove_resource(reciever_offer.resource_name, reciever_offer.amount)

    reciever_offer.settlement.add_resource(reciever_offer.resource_name, reciever_offer.amount)
    reciever_offer.settlement.remove_resource(provider_offer.resource_name, provider_offer.amount)
  end
end