FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 5) }
    email                   { Faker::Internet.free_email }
    password                { 'testtest2' }
    password_confirmation   { password }
    first_name              { Gimei.first.kanji }
    last_name               { Gimei.last.kanji }
    first_furigana          { Gimei.first.katakana }
    last_furigana           { Gimei.last.katakana }
    birthday                { Faker::Date.between(from: '1930-01-01', to: '2019-01-01') }
  end
end
