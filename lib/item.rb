class Item
  attr_reader :name, :price, :product_code

  def initialize(attributes = {})
    default_attributes.merge(attributes).tap do |a|
      @name         = a[:name]
      @price        = a[:price]
      @product_code = a[:product_code]
    end
  end

  private

  def default_attributes
    { name: "Item", price: 0.00, product_code: "000" }
  end
end
