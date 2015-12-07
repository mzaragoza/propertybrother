FactoryGirl.define do
  factory :account_payment do
    payment_type { AccountPayment.payment_type_list.sample.first }
    payment_date { DateTime.now }
    amount       { rand(50...50000) }
    account_id   {Account.last.id || FactoryGirl.create(:account).id }
  end
end

