FactoryGirl.define do
  factory :account do
    subdomain             { FFaker::Internet.domain_word }
    name                  { FFaker::Company.name }
    address               { FFaker::Address.street_address }
    city                  { FFaker::Address.city }
    state                 { FFaker::AddressUS.state_abbr }
    zip                   { FFaker::AddressUS.zip_code }
    number_of_appartments { rand(10...1000) }
    monthly_fee           { rand(50...50000) }
  end
end


