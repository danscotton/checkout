class Item
  attr_reader :name, :price, :product_code

  def initialize(options)
    @name = options[:name]
    @price = options[:price]
    @product_code = options[:product_code]
  end
end
