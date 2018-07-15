FactoryBot.define do
  factory :ext_api_v1_product, class: 'Ext::Api::V1::Product' do
    pid { Faker::Number.number(8)}
    name { Faker::StarWars.droid }
  end
end
