FactoryGirl.define do
  factory :terminal do
    name { Faker::Name.name }
    landline { "0#{Faker::Number.number(10)}" }
    email { Faker::Internet.email }
    payment_made { Faker::Number.positive }
    current_amount { Faker::Number.positive }
    active { true }
    tax {"0.0"}
    min_order_amount {50.0} 
    gstin_regex = /^\d\d[A-Z]{5}\d{4}[A-Z][0-9A-F][Z][0-9A-Z]$/
    gstin {Faker::Base.regexify(gstin_regex)}
    association :company

  end
end
