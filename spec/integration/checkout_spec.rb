require 'checkout'
require 'item'

describe "Adding items to the checkout" do
  it "can calculate the total of multiple items" do
    co = Checkout.new
    co.scan(fruit_tea)
    co.scan(strawberries)
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    co.scan(coffee)
    expect(co.total).to eq 22.45
  end
end
