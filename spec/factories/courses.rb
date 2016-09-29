FactoryGirl.define do
  factory :course do
    name        { Faker::Lorem.characters(10) }
    description { Faker::Lorem.characters(25) }
  end
end
