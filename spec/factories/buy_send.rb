FactoryBot.define do
  factory :buy_send do
    post_number { '123-4567' }
    area_id {34}
    city { '広島市' }
    address {'西区己斐上2-15-1'}
    building {''}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
