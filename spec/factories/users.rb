FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    name                  {gimei.last.kanji}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) + '1a'}
    password_confirmation {password}
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    affiliation_id        {rand(2..6)}
  end
end
