class Exchange < ApplicationRecord
  has_many :people, dependent: :destroy
  enum status: [:open, :closed]

  validates :name, presence: true
  validates :date, presence: true

  def active?
    (self.date <=> Date.today) == 1
  end

  def today?
    (self.date <=> Date.today) == 0
  end

  def past?
    (self.date <=> Date.today) == -1
  end
end
