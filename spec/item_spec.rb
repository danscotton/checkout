describe Item do
  context "an item without attributes" do
    subject { Item.new }

    its(:name) { should eq "Item" }
    its(:price) { should eq 0.00 }
    its(:product_code) { should eq "000" }
  end

  context "an item with attributes" do
    subject { Item.new(product_code: "DA1", name: "Fruit Tea", price: 5.00) }

    its(:name) { should eq "Fruit Tea" }
    its(:price) { should eq 5.00 }
    its(:product_code) { should eq "DA1" }
  end
end
