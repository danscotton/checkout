class BuyOneGetOneFree
  def initialize(items)
    @items = items
  end

  def price
    items.take(count).inject(0) { |total, item| total + item.price }
  end

  private

  attr_reader :items

  def count
    items.count - items.count / 2
  end
end
