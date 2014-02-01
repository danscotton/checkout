# helpers/product is included from spec_helper

describe "Adding items to the checkout" do
  it "can calculate the total of multiple items" do
    co = Checkout.new(pricing_rules)
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    co.scan(strawberries)
    co.scan(fruit_tea)
    co.scan(coffee)
    expect(co.total).to match_price 22.45
  end

  it "can process BOGOF offers" do
    co = Checkout.new(pricing_rules)
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    expect(co.total).to match_price 3.11
  end

  it "can process multibuy offers" do
    co = Checkout.new(pricing_rules)
    co.scan(strawberries)
    co.scan(strawberries)
    co.scan(fruit_tea)
    co.scan(strawberries)
    expect(co.total).to match_price 16.61
  end

  def pricing_rules
    PricingRules.new do
      add "FR1", BuyOneGetOneFreeOffer
      add "SR1", MultiBuyOffer, discount: 0.1, minimum_items: 3
    end
  end
end
