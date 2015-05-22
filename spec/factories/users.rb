require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.username { Faker::Internet.user_name }
    f.password { Faker::Internet.password }
    f.faculty { [true, false].sample }
  end
end
