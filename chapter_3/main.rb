Dir.glob("models/*.rb").each { |file| require_relative file }

settlement_repository = SettlementRepository.new("init.txt")
log = TradeLog.new("input.txt", settlement_repository)

log.transactions.each { |transaction| transaction.execute }

settlement_repository.print_report