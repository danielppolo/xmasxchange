class Exchange < ApplicationRecord
  has_many :people, dependent: :destroy
  enum status: [:open, :closed]

  validates :name, presence: true
  validates :date, presence: true
end
