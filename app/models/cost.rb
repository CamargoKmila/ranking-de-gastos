class Cost < ApplicationRecord
  belongs_to :deputy

  def self.totalCost
    self.sum(:vlrLiquido)
  end

  def self.maxCost
    self.order('`vlrLiquido` desc').first
  end
end
