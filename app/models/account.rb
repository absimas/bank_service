class Account < ApplicationRecord
  has_many :received, class_name: "Transaction", foreign_key: "recipient_id"
  has_many :sent, class_name: "Transaction", foreign_key: "sender_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
end
