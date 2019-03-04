FactoryBot.define do
  factory :cart do
    user { nil }
    order { nil }
    item { nil }
    quantity { 1 }
  end
end
