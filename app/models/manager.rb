class Manager < ActiveRecord::Base
  has_paper_trail

  has_many :account_managers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true, case_sensitive: false

  scope :active, lambda { where(active: true) }
  scope :inactive, lambda { where(active: false) }

  attr_accessor :updating_password

  def self.title_list
    [
      ['Account Manager', 'Account Manager'],
      ['Office Manager', 'Office Manager'],
      ['Secretary', 'Secretary'],
      ['Programmer', 'Programmer'],
      ['Sales', 'Sales'],
      ['Other', 'Other'],
    ]
  end

  def name
    (self.first_name + ' ' + self.last_name).titleize
  end

  def should_validate_password?
    updating_password || new_record?
  end

end

