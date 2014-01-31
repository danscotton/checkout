# helpers/product is included from spec_helper

describe "Adding items to the checkout" do
  it "can calculate the total of multiple items" do
    co = Checkout.new(PricingRule.for("FR1", BuyOneGetOneFree))
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    co.scan(strawberries)
    co.scan(fruit_tea)
    co.scan(coffee)
    expect(co.total).to eq 22.45
  end

  it "can process BOGOF pricing rules" do
    co = Checkout.new(PricingRule.for("FR1", BuyOneGetOneFree))
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    expect(co.total).to eq 3.11
  end

  it "can process multiple discount pricing rules" do
    co = Checkout.new(PricingRule.for("SR1", MultipleDiscount.by(0.1).minimum_of(3)))
    co.scan(strawberries)
    co.scan(strawberries)
    co.scan(fruit_tea)
    co.scan(strawberries)
    expect(co.total).to eq 16.61
  end
end
