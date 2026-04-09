class SettlementStorage
  def initialize
    @resources = [
      Resource.new("food"),
      Resource.new("medicine"),
      Resource.new("ammunition"),
      Resource.new("fuel"),
      Resource.new("wood"),
      Resource.new("metal")
    ]
  end

  def add(resource_name, amount)
    find(resource_name).increase(amount)
  end

  def remove(resource_name, amount)
    find(resource_name).decrease(amount)
  end

  def amount_of(resource_name)
    find(resource_name).amount
  end

  def to_s
    @resources.map { |resource| " - #{resource.name}: #{resource.amount}" }.join("\n")
  end

  private

  def find(resource_name)
    @resources.find { |r| r.name == resource_name }
  end
end
