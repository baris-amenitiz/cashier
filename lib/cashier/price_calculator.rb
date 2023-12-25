# frozen_string_literal: true

module Cashier
  # Calculate prices in one place with given price, product and order information
  class PriceCalculator
    def self.calculate(price:, order_count:, discount:, percentage:)
      return(order_count * price) if percentage && discount.nil?
      return((order_count * price).round(2) - (order_count * price * discount).round(2)) if percentage && discount

      order_count * price
    end
  end
end
