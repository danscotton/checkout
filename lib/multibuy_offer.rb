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
# class MultipleDiscount
#   @@discount = 0
#   @@minimum = 0

#   def self.by(discount)
#     @@discount = discount
#     self
#   end

#   def self.minimum_of(item_count)
#     @@minimum = item_count
#     self
#   end

#   def initialize(items)
#     @items = items
#   end

#   def price
#     items.inject(0) { |total, item| total + discount(item.price) }
#   end

#   private

#   attr_reader :items

#   def discount(price)
#     rule_applies? ? (price - (price * @@discount)) : price
#   end

#   def rule_applies?
#     items.count >= @@minimum
#   end
# end
