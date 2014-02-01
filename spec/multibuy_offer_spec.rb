describe MultiBuyOffer do
  let(:items) { [double(:item, price: 4.00), double(:item, price: 4.00)] }

  describe "setting options" do
    it "has a default :discount of 0" do
      offer = MultiBuyOffer.new(items)
      expect(offer.discount).to eq 0
    end

    it "has a default minimum_items of 0" do
      offer = MultiBuyOffer.new(items)
      expect(offer.minimum_items).to eq 0
    end

    it "can override discount" do
      offer = MultiBuyOffer.new(items, discount: 0.1)
      expect(offer.discount).to eq 0.1
    end

    it "can override minimum_items" do
      offer = MultiBuyOffer.new(items, minimum_items: 3)
      expect(offer.minimum_items).to eq 3
    end
  end

  it "will not apply the discount if the minimum_items is not met" do
    offer = MultiBuyOffer.new(items, minimum_items: 3, discount: 0.2)
    expect(offer.price).to eq 0
  end

  it "will apply the discount if the minimum_items is met" do
    offer = MultiBuyOffer.new(items, minimum_items: 2, discount: 0.2)
    expect(offer.price).to match_price -1.60
  end
end
