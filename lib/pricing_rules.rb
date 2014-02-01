class PricingRules
  def initialize(&block)
    @rules = []
    instance_eval &block if block_given?
  end

  def apply(items)
    rules.inject(items) do |items, rule|
      matched_items, non_matched_items = items.partition { |item| item.product_code == rule.product_code }
      process(matched_items, rule) + non_matched_items
    end
  end

  private

  attr_reader :rules

  def add(product_code, offer_class, offer_options = {})
    rules << Rule.new(product_code, offer_class, offer_options)
  end

  def process(items, rule)
    items.empty? ? items : rule.apply(items)
  end

  class Rule < Struct.new(:product_code, :offer_class, :offer_options)
    def apply(items)
      [items, offer_class.new(*args(items))].flatten
    end

    private

    def args(items)
      offer_options.empty? ? [items] : [items, offer_options]
    end
  end
end
