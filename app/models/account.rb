class Account < ActiveRecord::Base
  has_paper_trail

  has_many :account_payments
  has_many :account_managers
  has_many :account_documents

  validates :subdomain, presence: true, uniqueness: true, case_sensitive: false
  before_validation { |account| account.subdomain = subdomain.downcase.gsub(/[^0-9a-z\+]/, "").gsub(' ', '').to_s}
  after_create :create_apartment

  def full_address
    (address.to_s + ' ' + city.to_s + ' ' + state + ' ' + zip.to_s).titleize
  end

  def number_of_board_members
    rand(100...1000)
  end

  def manager
    'John Doe'
  end

  private
  def create_apartment
    Apartment::Tenant.create(subdomain)
  end

end

