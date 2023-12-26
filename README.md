# Cashier
Hi! I generated a gem project to implement the task just because it gives a familiar structure to everyone.
I used MiniTest since I didn't want to add any dependency like RSpec for a small task.

## Installation
You will need ruby > 3.1.0. To install 3.1.2 with rbenv and switch to it;

    $ rbenv install 3.1.2
    $ rbenv shell 3.1.2

## Usage
There are 20 test specs under ./test/lib folder. If you run;

    $ ./bin/setup

it will automatically install gems, runs tests and rubocop.

then, you can get into irb session with;

    $ ./bin/console

in there you can get predefined items like this;

```ruby
irb> cf1_item = Cashier::Item.cf1_item
=> {:code=>:CF1, :price=>11.23, :name=>"Coffee"}

irb> sr1_item = Cashier::Item.sr1_item
=> {:code=>:SR1, :price=>5.0, :name=>"Strawberries"}

irb> gr1_item = Cashier::Item.gr1_item
=> {:code=>:GR1, :price=>3.11, :name=>"Green tea"}
```

then you can create a `Checkout` object with default promotion rules;

```ruby
irb> checkout = Cashier::Checkout.new
=> #<Cashier::Checkout:0x000000010485ed50
```

if you want to define your own rules;
i.e; customers can get %50 discount for 5 or more Green Tea orders;

```ruby
irb> pricing_rule = Cashier::PromotionRules::DiscountRule.new(discount:0.5, order_count: 5, product_code: :GR)
=> #<Cashier::PromotionRules::DiscountRule:0x0000000104855070 @discount=0.5, @order_count=5, @product_code=:GR>
```

then you can create `Checkout` object with this new rule;

```ruby
irb> checkout = Cashier::Checkout.new(pricing_rules: [pricing_rule])
=> #<Cashier::Checkout:0x0000000100e094e8
irb> checkout
=>
#<Cashier::Checkout:0x0000000102edf0a0
 @items={},
 @pricing_rules=
  [#<Cashier::PromotionRules::DiscountRule:0x0000000102edf000 @discount=0.33333333333333337, @order_count=3, @product_code=:CF1>,
   #<Cashier::PromotionRules::DiscountRule:0x0000000102edf050 @discount=0.1, @order_count=3, @product_code=:SR1>,
   #<Cashier::PromotionRules::FreeProductRule:0x0000000102edef88 @free_count=1.0, @order_count=2.0, @product_code=:GR1>]>
```
or you can define multiple rules and generate a checkout object with those rules.

`Checkout` class only consider latest defined rule if there's multiple rules for the same product.
i.e; if you defined 3 rules for GR1 and 5 rules for SR1, `Checkout` class only consider the latter one.

To scan items and get the total price(an example from test data you gave);

| Basket | Total price expected |   
| GR1,CF1,SR1,CF1,CF1 |  30.57€ |

```ruby
irb> checkout.scan(gr1_item)
=> 1
irb> checkout.scan(cf1_item)
=> 1
irb> checkout.scan(sr1_item)
=> 1
irb> checkout.scan(cf1_item)
=> 2
irb> checkout.scan(cf1_item)
=> 3
irb> checkout.total
=> "30.57€"
```
