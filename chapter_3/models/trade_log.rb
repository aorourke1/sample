class TradeLog
  attr_reader :transactions

  def initialize(input_file, settlement_repository)
    @input_file = input_file
    @settlement_repository = settlement_repository
    @transactions = parse_transactions
  end

  def parse_transactions
    File.readlines(@input_file).map do |line|
      trade_line = line.split(",").map(&:strip)

      provider_settlement = @settlement_repository.find_or_create(trade_line[0])
      receiver_settlement = @settlement_repository.find_or_create(trade_line[3])

      provider_offer = TradeOffer.new(provider_settlement, trade_line[1], trade_line[2].to_i)
      reciever_offer = TradeOffer.new(receiver_settlement, trade_line[4], trade_line[5].to_i)

      Transaction.new(provider_offer, reciever_offer)
    end
  end
end