# frozen_string_literal: true

require "test_helper"

module Cashier
  class PriceCalculatorTest
    describe ".calculate" do
      it 'multiplies price with ordered item count when the rule is percentage but
the order not sufficient to get a discount' do
        price = Cashier::PriceCalculator.calculate(price: 10,
                                                   order_count: 1,
                                                   discount: nil,
                                                   percentage: true)
        assert_equal(price, 10)
      end

      it "returns %50 discounted price when the rule is percentage and the order is sufficient to get a discount" do
        price = Cashier::PriceCalculator.calculate(price: 10,
                                                   order_count: 3,
                                                   discount: 0.50,
                                                   percentage: true)
        assert_equal(price, 15)
      end

      it "multiplies order_count with price of the item if there is no percentage" do
        price = Cashier::PriceCalculator.calculate(price: 10,
                                                   order_count: 3,
                                                   discount: nil,
                                                   percentage: false)
        assert_equal(price, 30)
      end
    end
  end
end
