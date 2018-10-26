class Person < ApplicationRecord
  has_one :person
  has_many :gifts, dependent: :destroy
  belongs_to :exchange
  validates :name, presence: true
  validates :key, presence: true
  validates :exchange, presence: true
end
