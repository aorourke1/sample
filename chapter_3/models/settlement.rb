class Settlement
  attr_reader :name

  def initialize(name)
    @name = name
    @storage = SettlementStorage.new
  end

  def add_resource(resource_name, amount)
    @storage.add(resource_name, amount)
  end

  def remove_resource(resource_name, amount)
    @storage.remove(resource_name, amount)
  end

  def resource_amount(resource_name)
    @storage.amount_of(resource_name)
  end

  def to_s
    "Settlement: #{@name}\n#{@storage}"
  end
end