# frozen_string_literal: true

require "test_helper"

module Cashier
  module PromotionRules
    class FreeProductRuleTest
      describe "#items_to_pay" do
        it "returns 5 to pay order for buy-1-get-1-free case if customer buys 10 items" do
          rule = Cashier::PromotionRules::FreeProductRule.new

          assert_equal(rule.items_to_pay(10), 5)
        end

        it "returns 3 to pay order for buy-1-get-1-free case if customer buys 5 items" do
          rule = Cashier::PromotionRules::FreeProductRule.new

          assert_equal(rule.items_to_pay(5), 3)
        end

        it "returns 1 to pay order for buy-1-get-1-free case if customer buys 1 item" do
          rule = Cashier::PromotionRules::FreeProductRule.new

          assert_equal(rule.items_to_pay(1), 1)
        end
      end
    end
  end
end
