class Checkout
  def initialize(rules = NoPricingRules)
    @items = []
    @rules = rules
  end

  def scan(item)
    items << item
  end

  def total
    x = rules.apply(items)
    x.inject(0) { |total, item| total + item.price }
  end

  private

  attr_reader :items, :rules

  class NoPricingRules
    def self.apply(items)
      items
    end
  end
end
