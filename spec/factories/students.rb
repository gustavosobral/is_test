FactoryGirl.define do
  factory :student do
    name            Faker::Name.name
    register_number '11118303'
  end
end
