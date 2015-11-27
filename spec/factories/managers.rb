FactoryGirl.define do
  factory :manager do
    email      { FFaker::Internet.email }
    password   'password'
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
  end
end

