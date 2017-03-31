class Account < ApplicationRecord
  has_many :sent, class_name: "Transaction", foreign_key: "sender_id"
  has_many :received, class_name: "Transaction", foreign_key: "recipient_id"

  validates :first_name, presence: true
  validates :last_name, presence: true

  def transactions
    [*sent, *received]
  end

  def unique_transactions
    transactions.uniq { |t| t.id }
  end
end