class MultiBuyOffer < Offer
  def default_options
    { discount: 0, minimum_items: 0 }
  end

  def discount
    options[:discount]
  end

  def minimum_items
    options[:minimum_items]
  end

  def price
    offer_applies? ? calculate_offer : 0
  end

  private

  def offer_applies?
    items.count >= minimum_items
  end

  def calculate_offer
    items.inject(0) do |subtotal, item|
      subtotal - (item.price * discount)
    end
  end
end
