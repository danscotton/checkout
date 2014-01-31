describe BuyOneGetOneFree do
  describe "two items" do
    specify "have the same price as one item" do
      items = [double(price: 5.00), double(price: 5.00)]
      expect(BuyOneGetOneFree.new(items).price).to eq 5
    end
  end
end
