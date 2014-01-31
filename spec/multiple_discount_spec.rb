describe MultipleDiscount do
  context "without any parameters set" do
    it "returns the original items" do
      items = [double(price: 5.00)]
      offer = MultipleDiscount.new(items)
      expect(offer.price).to eq 5
    end
  end

  context "setting a discount" do
    it "applies it to all items" do
      items = [double(price: 5.00), double(price: 3.00)]
      offer = MultipleDiscount.by(0.1).new(items)
      expect(offer.price).to eq 7.2
    end
  end

  context "setting minimum_of" do
    it "ignores the discount rules if there are less items" do
      items = [double(price: 5.00), double(price: 3.00)]
      offer = MultipleDiscount.by(0.1).minimum_of(3).new(items)
      expect(offer.price).to eq 8
    end
  end
end
