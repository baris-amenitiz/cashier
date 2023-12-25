# frozen_string_literal: true

module Cashier
  module PromotionRules
    # DiscountRule class to define promotions with percentage
    class DiscountRule
      attr_reader :product_code, :order_count, :discount

      def initialize(product_code: :SR1, order_count: 3, discount: 0.1)
        @discount = discount
        @order_count = order_count
        @product_code = product_code
      end

      def assign_discount(ordered)
        discount if ordered >= order_count
      end
    end
  end
end
