# frozen_string_literal: true

require "test_helper"

module Cashier
  class ItemTest
    describe ".class_methods" do
      it "returns .cf1_item" do
        assert_equal(Cashier::Item.cf1_item, Cashier::Item::PRODUCT_LIST[:CF1])
      end

      it "returns .gr1_item" do
        assert_equal(Cashier::Item.gr1_item, Cashier::Item::PRODUCT_LIST[:GR1])
      end

      it "returns .sr1_item" do
        assert_equal(Cashier::Item.sr1_item, Cashier::Item::PRODUCT_LIST[:SR1])
      end

      it "contains code key" do
        assert_equal(Cashier::Item.sr1_item[:code], Cashier::Item::PRODUCT_LIST[:SR1][:code])
      end

      it "contains name key" do
        assert_equal(Cashier::Item.sr1_item[:name], Cashier::Item::PRODUCT_LIST[:SR1][:name])
      end

      it "contains price key" do
        assert_equal(Cashier::Item.sr1_item[:price], Cashier::Item::PRODUCT_LIST[:SR1][:price])
      end
    end
  end
end
