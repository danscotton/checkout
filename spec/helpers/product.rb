module ProductHelpers
  def fruit_tea
    Item.new(product_code: "FR1", name: "Fruit Tea", price: 3.11)
  end

  def strawberries
    Item.new(product_code: "SR1", name: "Strawberries", price: 5.00)
  end

  def coffee
    Item.new(product_code: "CF1", name: "Coffee", price: 11.23)
  end
end
