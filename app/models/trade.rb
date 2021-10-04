class Trade < ApplicationRecord

  validates_inclusion_of :shares, :in => 0..100
  validates_inclusion_of :trade_type, :in => %w[buy sell]

  scope :by_user_id, lambda { |q|
    where(user_id: q) if q.present?
  }

  scope :by_trade_type, lambda { |q|
    where(trade_type: q) if q.present?
  }

end
