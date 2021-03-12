FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname { '買い物君' }
    first_name { '太郎' }
    first_name_kana { 'タロウ' }
    family_name { '山本' }
    family_name_kana {'ヤマモト'}
    birthday { '2000-01-01' }
  end
end