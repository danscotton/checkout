class PricingRule
  def self.for(product_code, offer_class)
    new(product_code, offer_class)
  end

  def initialize(product_code, offer_class)
    @product_code, @offer_class = product_code, offer_class
  end

  def apply(items)
    matches, non_matches = items.partition {|item| item.product_code == product_code }
    process(matches) + non_matches
  end

  private

  attr_reader :product_code, :offer_class

  def process(matched_items)
    matched_items.empty? ? matched_items : [offer_class.new(matched_items)]
  end
end

