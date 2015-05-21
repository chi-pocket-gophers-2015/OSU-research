FactoryGirl.define do
    factory :proposal do |f|
      f.title { Faker::Lorem.sentence }
      f.hypothesis { Faker::Lorem.paragraph }
      f.active { [true, false].sample }
      f.summary { Faker::Lorem.sentences(3) }
    end
  end
