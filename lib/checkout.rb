class Checkout
  def initialize(rules = [])
    @items = []
    @rules = [rules].flatten
  end

  def scan(item)
    items << item
  end

  def total
    process_pricing_rules.inject(0) { |total, item| total + item.price }
  end

  private

  attr_reader :items, :rules

  def process_pricing_rules
    rules.inject(items) {|items, rule| rule.apply(items) }
  end
end
