# frozen_string_literal: true

require "test_helper"

module Cashier
  module PromotionRules
    class DiscountRuleTest
      describe "#assigns_discount" do
        it "returns discount when ordered items are equal to order_count" do
          rule = Cashier::PromotionRules::DiscountRule.new(order_count: 3)

          assert_equal(rule.assign_discount(3), rule.discount)
        end

        it "returns discount when ordered items are more than order_count" do
          rule = Cashier::PromotionRules::DiscountRule.new(order_count: 3)

          assert_equal(rule.assign_discount(5), rule.discount)
        end

        it "returns nil when ordered items are less than order_count" do
          rule = Cashier::PromotionRules::DiscountRule.new(order_count: 3)

          assert_nil(rule.assign_discount(2))
        end
      end
    end
  end
end
