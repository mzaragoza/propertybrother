FactoryGirl.define do
  factory :manager do
    email        { FFaker::Internet.email }
    password     'password'
    first_name   { FFaker::Name.first_name }
    last_name    { FFaker::Name.last_name }
    home_phone   { FFaker::PhoneNumber.short_phone_number }
    cell_phone   { FFaker::PhoneNumber.short_phone_number }
    office_phone { FFaker::PhoneNumber.short_phone_number }
    extension    { FFaker::PhoneNumber.area_code }
    address      { FFaker::Address.street_address }
    city         { FFaker::Address.city }
    state        { FFaker::AddressUS.state_abbr }
    zip          { FFaker::AddressUS.zip_code }
    title        { Manager.title_list.sample.first }
  end
end

