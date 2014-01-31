class MultipleDiscount
  @@discount = 0
  @@minimum = 0

  def self.by(discount)
    @@discount = discount
    self
  end

  def self.minimum_of(item_count)
    @@minimum = item_count
    self
  end

  def initialize(items)
    @items = items
  end

  def price
    items.inject(0) { |total, item| total + discount(item.price) }
  end

  private

  attr_reader :items

  def discount(price)
    rule_applies? ? (price - (price * @@discount)) : price
  end

  def rule_applies?
    items.count >= @@minimum
  end
end
