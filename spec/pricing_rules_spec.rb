describe PricingRules do
  it "returns the items untouched if no rules are added" do
    items = [double(product_code: "A"), double(product_code: "B")]
    rules = PricingRules.new
    expect(rules.apply(items)).to match_array items
  end

  it "does not create an offer object if no items match the offer's product code" do
    items = [double(product_code: "A"), double(product_code: "B")]
    my_offer = double(:my_offer_class)
    rules = PricingRules.new do
      add "C", my_offer
    end
    expect(my_offer).not_to receive(:new)
    rules.apply(items)
  end

  it "creates an offer object if any items match the offer's product code" do
    item_a, item_b = double(product_code: "A"), double(product_code: "B")
    items = [item_a, item_b]
    my_offer = double(:my_offer_class)
    rules = PricingRules.new do
      add "A", my_offer
    end
    expect(my_offer).to receive(:new).with([item_a]).and_return([item_a])
    rules.apply(items)
  end

  it "returns the original items and the offer object if there is a match" do
    item_a, item_b = double(:item, product_code: "A"), double(:item, product_code: "B")
    items = [item_a, item_b]
    my_offer = double(:my_offer_class)
    allow(my_offer).to receive(:new).with([item_a]).and_return([my_offer])
    rules = PricingRules.new do
      add "A", my_offer
    end
    expect(rules.apply(items)).to match_array [item_a, item_b, my_offer]
  end

  it "passes offer options to the offer class if they're specified" do
    item_a, item_b = double(product_code: "A"), double(product_code: "B")
    items = [item_a, item_b]
    my_offer = double(:my_offer_class)
    options = {my_option: true}
    rules = PricingRules.new do
      add "A", my_offer, options
    end
    expect(my_offer).to receive(:new).with([item_a], options).and_return([item_a])
    rules.apply(items)
  end
end
