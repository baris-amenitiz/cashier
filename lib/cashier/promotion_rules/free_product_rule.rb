# frozen_string_literal: true

module Cashier
  module PromotionRules
    # FreeProductRule class to define promotions for buy x get y for free
    class FreeProductRule
      attr_reader :product_code, :order_count, :free_count

      def initialize(product_code: :GR1, order_count: 2.0, free_count: 1.0)
        @free_count = free_count
        @order_count = order_count
        @product_code = product_code
      end

      def items_to_pay(ordered)
        (ordered / (order_count * free_count)).ceil
      end
    end
  end
end
