class SettlementRepository
  attr_reader :settlements

  def initialize(init_file = "init.txt")
    @settlements = {}
    load(init_file)
  end

  def find_or_create(name)
    settlements[name] ||= Settlement.new(name)
  end

  def load(init_file)
    File.readlines(init_file).each do |line|
      settlement_name, resource, amount = line.split(",").map(&:strip)
      settlement = find_or_create(settlement_name)
      settlement.add_resource(resource, amount.to_i)
    end
  end

  def print_report
    settlements.each_value do |settlement|
      puts "#{settlement}\n\n"
    end
  end
end