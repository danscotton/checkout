class Checkout
  def initialize(rules = NoPricingRules)
    @items, @rules = [], rules
  end

  def scan(item)
    items << item
  end

  def total
    rules.apply(items).inject(0) { |subtotal, item| subtotal + item.price }
  end

  private

  attr_reader :items, :rules

  class NoPricingRules
    def self.apply(items)
      items
    end
  end
end
