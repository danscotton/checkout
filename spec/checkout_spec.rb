require 'checkout'

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
end

