class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Account'
  belongs_to :recipient, class_name: 'Account'

  validates :sender, presence: true
  validates :recipient, presence: true
  validates :amount, presence: true

  validate :sender_and_recipient_differ

  def sender_and_recipient_differ
    if sender == recipient
      errors.add(:sender, 'cannot create a transaction to self')
    end
  end
end
