# frozen_string_literal: true

module Cashier
  # Pre-defined items class
  class Item
    PRODUCT_LIST = {
      CF1: { code: :CF1, price: 11.23, name: "Coffee" },
      GR1: { code: :GR1, price: 3.11, name: "Green tea" },
      SR1: { code: :SR1, price: 5.00, name: "Strawberries" }
    }.freeze

    def self.cf1_item
      PRODUCT_LIST[:CF1]
    end

    def self.gr1_item
      PRODUCT_LIST[:GR1]
    end

    def self.sr1_item
      PRODUCT_LIST[:SR1]
    end
  end
end
