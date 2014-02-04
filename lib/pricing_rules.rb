class PricingRules
  def initialize(&block)
    @rules = []
    instance_eval(&block) if block_given?
  end

  def apply(items)
    rules.inject(items) { |items, rule| items << rule.create_offer_for(items) }.compact
  end

  def add(product_code, offer_class, offer_options = {})
    rules << Rule.new(product_code, offer_class, offer_options)
  end

  private

  attr_reader :rules

  class Rule < Struct.new(:product_code, :offer_class, :offer_options)
    def create_offer_for(items)
      offer_class.new(matching_items(items), offer_options) unless no_matches?(items)
    end

    private

    def matching_items(items)
      items.partition { |item| item.product_code == product_code }.first
    end

    def no_matches?(items)
      matching_items(items).empty?
    end
  end
end
