describe BuyOneGetOneFreeOffer do
  describe "one item" do
    it "costs the price of one item" do
      items = [double(price: 5.00)]
      offer = BuyOneGetOneFreeOffer.new(items)
      expect(offer.price).to eq 0
    end
  end

  describe "two items" do
    it "costs the price of one item" do
      items = [double(price: 5.00), double(price: 5.00)]
      offer = BuyOneGetOneFreeOffer.new(items)
      expect(offer.price).to eq -5
    end
  end

  describe "three items" do
    it "costs the price of two items" do
      items = [double(price: 5.00), double(price: 5.00), double(price: 5.00)]
      offer = BuyOneGetOneFreeOffer.new(items)
      expect(offer.price).to eq -5
    end
  end
end
