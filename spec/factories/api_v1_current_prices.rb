FactoryBot.define do
  factory :api_v1_current_price, class: 'Api::V1::CurrentPrice' do
    pid { Faker::Number.number(8) }
    value { Faker::Number.decimal(2) }
    currency_code { Faker::Currency.code }
  end
end
