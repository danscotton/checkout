describe PricingRule do
  let(:offer) { double(:offer) }
  let(:a) { double(:item, product_code: "AA1") }
  let(:b) { double(:item, product_code: "BB1") }
  let(:c) { a }
  let(:items) { [a, b, c] }

  context "items that don't match the product code" do
    it "does not create the offer" do
      rule = PricingRule.for("CC1", offer)
      expect(offer).not_to receive(:new)
      rule.apply(items)
    end
  end

  context "items that do match the product code" do
    let(:rule) { PricingRule.for("AA1", offer) }

    it "creates an offer object, passing the matched items" do
      expect(offer).to receive(:new).with([c, a])
      rule.apply(items)
    end

    it "returns an array of new offer item, and the original unmatched items" do
      allow(offer).to receive(:new).and_return(offer)
      expect(rule.apply(items)).to match_array [offer, b]
    end
  end
end
