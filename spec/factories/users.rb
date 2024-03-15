FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { %w[佐藤 田中 山田].sample }
    first_name            { %w[太郎 次郎 花子].sample }
    family_name_kana      { %w[サトウ タナカ ヤマダ].sample }
    first_name_kana       { %w[タロウ ジロウ ハナコ].sample }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
