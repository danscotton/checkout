describe Checkout do
  it "has a total of 0 when it contains no items" do
    checkout = Checkout.new
    expect(checkout.total).to eq 0
  end

  it "can calculate the total of a number of items scanned into the checkout" do
    checkout = Checkout.new
    checkout.scan(double(price: 1.20))
    checkout.scan(double(price: 2.30))
    checkout.scan(double(price: 3.50))
    expect(checkout.total).to eq 7
  end

  it "can take a pricing rules object which gets passed the array of items on total" do
    rule = double(:rule)
    item_a, item_b = double(:item, price: 1), double(:item, price: 2)
    items = [item_a, item_b]
    expect(rule).to receive(:apply).with(items).and_return(items)

    checkout = Checkout.new(rule)
    checkout.scan(item_a)
    checkout.scan(item_b)
    checkout.total
  end
end
