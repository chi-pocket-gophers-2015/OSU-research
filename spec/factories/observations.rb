require 'faker'

FactoryGirl.define do
  factory :observation do |f|
    f.body { Faker::Lorem.paragraph }
  end
end
