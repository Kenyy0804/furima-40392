FactoryBot.define do
  factory :purchase_shipping do
    post_code { '123-4567' }
    municipalities { '那覇市' }
    region_id { 3 }
    address { '那覇1-1' }
    building_name { '沖縄ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
    phone_number {'09012345678'}
  end
end
