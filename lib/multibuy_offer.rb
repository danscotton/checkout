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
    if apply_offer?
      items.inject(0) do |total, item|
        total - (item.price * discount)
      end
    else
      0
    end
  end

  private

  def apply_offer?
    items.count >= minimum_items
  end
end
