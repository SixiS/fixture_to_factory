FactoryGirl.define do

  factory :strawberry, class: Milkshake
    name { %|Strawberry \| milkshake| }
    ingrdients { %|Strawberries I think| }
  end

  factory :chocolage, class: Milkshake
    name { %|Chocolate milkshake| }
    organization { %|LOTS OF CHOCS| }
  end

  factory :meat, class: Milkshake
    name { %|MAN SHAKE| }
    organization { %|Steak and babies| }
  end

end