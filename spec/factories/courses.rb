FactoryGirl.define do
  factory :course do
    name        { Faker::Lorem.characters(10) }
    description { Faker::Lorem.characters(40) }
  end
end
