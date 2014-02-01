class Offer
  attr_reader :items

  def initialize(items = [], options = {})
    @items = items
    @options = options
  end

  def price
    raise NotImplementedError, "You need to implement :price in your Offer subclass."
  end

  def options
    default_options.merge(@options)
  end

  def product_code
    :offer
  end

  def item_price
    items.first.price
  end

  private

  def default_options
    {}
  end
end
