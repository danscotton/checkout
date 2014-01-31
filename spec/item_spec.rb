describe Item do
  subject { Item.new(product_code: "DA1", name: "Fruit Tea", price: 5.00) }

  its(:name) { should eq "Fruit Tea" }
  its(:price) { should eq 5.00 }
  its(:product_code) { should eq "DA1" }
end
