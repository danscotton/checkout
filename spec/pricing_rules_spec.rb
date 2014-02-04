describe PricingRules do
  let(:item_a) { double(:item, product_code: "A") }
  let(:item_b) { double(:item, product_code: "B") }
  let(:items)  { [item_a, item_b] }

  describe "when no rules have been added" do
    it "returns the items untouched" do
      rules = PricingRules.new
      expect(rules.apply(items)).to match_array items
    end
  end

  describe "when a rule has been added" do
    describe "with options" do
      it "creates an instance of the offer with the options" do
        my_offer = double(:my_offer_class)
        options = {my_option: true}
        expect(my_offer).to receive(:new).with([item_a], options)

        rules = PricingRules.new { add "A", my_offer, options }
        rules.apply(items)
      end
    end

    describe "that does not match any items" do
      it "does not create an instance of the offer" do
        my_offer = double(:my_offer_class)
        expect(my_offer).not_to receive(:new)

        rules = PricingRules.new { add "C", my_offer }
        rules.apply(items)
      end
    end

    describe "that does match an item" do
      it "creates an instance of the offer with the matched items" do
        my_offer = double(:my_offer_class)
        expect(my_offer).to receive(:new).with([item_a], {})

        rules = PricingRules.new { add "A", my_offer }
        rules.apply(items)
      end

      it "returns an array of the original items along with the offer instance" do
        my_offer = double(:my_offer_class)
        allow(my_offer).to receive(:new).with([item_a], {}).and_return(my_offer)

        rules = PricingRules.new { add "A", my_offer }
        expect(rules.apply(items)).to match_array [item_a, item_b, my_offer]
      end
    end
  end
end
