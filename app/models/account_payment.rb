class AccountPayment < ActiveRecord::Base
  has_paper_trail

  belongs_to :account

  validates :account_id, presence: true
  validates :payment_type, presence: true
  validates :payment_date, presence: true
  validates :amount, presence: true

  def self.payment_type_list
    [
      ['Cash', 'Cash'],
      ['Check', 'Check'],
      ['Credit Card', 'Credit Card'],
      ['Direct Deposit', 'Direct Deposit'],
      ['Other', 'Other'],
    ]
  end
end

