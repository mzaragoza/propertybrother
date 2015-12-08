FactoryGirl.define do
  factory :account_manager do
    account_id   {Account.last.id || FactoryGirl.create(:account).id }
    manager_id   {Manager.last.id || FactoryGirl.create(:manager).id }
  end
end

