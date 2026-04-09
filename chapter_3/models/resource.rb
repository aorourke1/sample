class Resource
  attr_reader :name, :amount

  def initialize(name, amount = 0)
    @name = name
    @amount = amount
  end

  def increase(amount)
    @amount += amount
  end

  def decrease(amount)
    @amount -= amount
  end
end