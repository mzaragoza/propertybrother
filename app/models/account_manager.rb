class AccountManager < ActiveRecord::Base
  has_paper_trail

  belongs_to :account
  belongs_to :manager

  validates :account_id, presence: true
  validates :manager_id, presence: true
  validates_uniqueness_of :manager_id, :scope => [:account_id]
end


