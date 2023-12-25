# frozen_string_literal: true

require "test_helper"

module Cashier
  class CheckoutTest
    describe "#scan" do
      it "scans and counts items" do
        checkout = Cashier::Checkout.new

        item1 = Cashier::Item.cf1_item
        item2 = Cashier::Item.gr1_item

        checkout.scan(item1)
        checkout.scan(item2)
        checkout.scan(item2)

        assert_equal(checkout.send(:items), { CF1: 1, GR1: 2 })
      end
    end

    # rubocop:disable Metrics/BlockLength
    describe "#total" do
      it "returns total sum and this is the first test data in the task" do
        checkout = Cashier::Checkout.new

        item_gr1 = Cashier::Item.gr1_item

        checkout.scan(item_gr1)
        checkout.scan(item_gr1)

        assert_equal(checkout.total, "€3.11")
      end

      it "returns total sum and this is the second test data in the task" do
        checkout = Cashier::Checkout.new

        item_gr1 = Cashier::Item.gr1_item
        item_sr1 = Cashier::Item.sr1_item

        checkout.scan(item_sr1)
        checkout.scan(item_sr1)
        checkout.scan(item_gr1)
        checkout.scan(item_sr1)

        assert_equal(checkout.total, "€16.61")
      end

      it "returns total sum and this is the latest test data in the task" do
        checkout = Cashier::Checkout.new

        item_gr1 = Cashier::Item.gr1_item
        item_sr1 = Cashier::Item.sr1_item
        item_cf1 = Cashier::Item.cf1_item

        checkout.scan(item_gr1)
        checkout.scan(item_cf1)
        checkout.scan(item_sr1)
        checkout.scan(item_cf1)
        checkout.scan(item_cf1)

        assert_equal(checkout.total, "€30.57")
      end
    end
    # rubocop:enable Metrics/BlockLength
  end
end
