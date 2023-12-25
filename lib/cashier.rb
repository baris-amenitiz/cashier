# frozen_string_literal: true

require_relative "cashier/version"

require_relative "cashier/item"
require_relative "cashier/checkout"
require_relative "cashier/price_calculator"
require_relative "cashier/promotion_rules/discount_rule"
require_relative "cashier/promotion_rules/free_product_rule"

module Cashier
  class Error < StandardError; end
  # Your code goes here...
end
