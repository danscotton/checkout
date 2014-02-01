class BuyOneGetOneFreeOffer < Offer
  def price
    (items.count / 2) * item_price * -1
  end
end
