# frozen_string_literal: true

module Cashier
  # Checkout class to scan items and get total sum
  class Checkout
    def initialize(pricing_rules: [])
      assign_pricing_rules(pricing_rules)
      @items = Hash.new { 0 }
    end

    def scan(item)
      items[item[:code]] += 1
    end

    def total
      total_sum = basket.sum do |product_code, order_count|
        rule = find_pricing_rule(product_code)
        calculate_total_sum(rule, order_count, product_code)
      end

      format_total_sum(total_sum)
    end

    private

    attr_reader :pricing_rules, :items

    def basket
      @basket ||= items.reject { |_product_code, price| price.zero? }
    end

    def format_total_sum(total_sum)
      "€#{total_sum.round(2)}"
    end

    def find_pricing_rule(product_code)
      pricing_rules.find { |pricing_rule| pricing_rule.product_code == product_code }
    end

    def calculate_total_sum(rule, order_count, product_code)
      Cashier::PriceCalculator.calculate(
        price: Item::PRODUCT_LIST[product_code][:price],
        percentage: discount_rule?(rule),
        order_count: discount_rule?(rule) ? order_count : rule.items_to_pay(order_count),
        discount: discount_rule?(rule) ? rule.assign_discount(order_count) : nil
      )
    end

    def discount_rule?(rule)
      rule.is_a?(Cashier::PromotionRules::DiscountRule)
    end

    def assign_pricing_rules(pricing_rules)
      rules = (default_rules + pricing_rules).reverse
      coffee_item_rule = rules.find { |rule| rule.product_code == :CF1 }
      strawberry_item_rule = rules.find { |rule| rule.product_code == :SR1 }
      green_tea_item_rule = rules.find { |rule| rule.product_code == :GR1 }

      @pricing_rules = [coffee_item_rule, strawberry_item_rule, green_tea_item_rule]
    end

    def default_rules
      [
        PromotionRules::DiscountRule.new(product_code: :SR1),
        PromotionRules::DiscountRule.new(product_code: :CF1, discount: 0.33333333333333337),
        PromotionRules::FreeProductRule.new(product_code: :GR1)
      ]
    end
  end
end
