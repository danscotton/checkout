class MyOffer < Offer
end

describe Offer do
  it "has a default product_code" do
    expect(MyOffer.new.product_code).to eq :offer
  end

  it "is created with an array of items" do
    items = [double(:item), double(:item)]
    offer = MyOffer.new(items)
    expect(offer.items).to match_array items
  end

  it "can be passed an optional hash of offer options" do
    items = [double(:item), double(:item)]
    offer = MyOffer.new(items, my_option: true)
    expect(offer.options).to eq my_option: true
  end

  it "has an item_price helper method" do
    items = [double(:item, price: 5.00)]
    offer = MyOffer.new(items)
    expect(offer.item_price).to eq 5.00
  end

  describe "subclasses of Offer" do
    specify "need to implement :price" do
      expect { MyOffer.new.price }.to raise_error(NotImplementedError)
    end
  end
end
