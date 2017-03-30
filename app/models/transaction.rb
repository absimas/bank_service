class Transaction < ApplicationRecord
  belongs_to :sender, class_name: "Account"
  belongs_to :recipient, class_name: "Account"

  validates :sender, presence: true
  validates :recipient, presence: true
  validates :amount, presence: true
end
