class AccountDocument < ActiveRecord::Base
  has_paper_trail

  belongs_to :account

  validates :account_id, presence: true
  validates :name, presence: true
  validates :document_type, presence: true
  validates :file, presence: true

  mount_uploader :file, FileUploader

  def self.type_list
    [
      ['Contact', 'Contact'],
      ['Agreement', 'Agreement'],
      ['Other', 'Other'],
    ]
  end
end


