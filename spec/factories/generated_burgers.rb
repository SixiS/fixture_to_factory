FactoryGirl.define do

  factory :cheese_burger, class: Burger
    name { %|Cheese burger| }
    description { %|Burger of cheese| }
  end

  factory :hamburger, class: Burger
    name { %|Hamburger| }
    sold { 50 }
  end

  factory :brie_burger, class: Burger
    name { %|Burger of brie| }
    description { %|Gross cheese and stuff| }
  end

end