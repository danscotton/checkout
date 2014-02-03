# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'helpers/product'
require 'checkout'
require 'item'
require 'pricing_rules'
require 'offer'
require 'buy_one_get_one_free_offer'
require 'multibuy_offer'

RSpec::Matchers.define :match_price do |expected|
  match do |actual|
    expect(actual).to be_within(0.001).of(expected)
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include ProductHelpers
  config.order = 'random'
end
