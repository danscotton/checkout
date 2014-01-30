class Checkout
  def initialize
    @items = []
  end

  def scan(item)
    items << item
  end

  def total
    items.inject(0) { |total, item| total + item.price }
  end

  private

  attr_reader :items
end
