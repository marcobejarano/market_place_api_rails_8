class Order < ApplicationRecord
  before_validation :set_total!
  after_commit :set_total!, on: [:create, :update]
  
  validates :total,
    numericality: {
      greater_than_or_equal_to: 0
    },
    presence: true
    
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements
  
  def set_total!
    self.total = products.sum :price
  end
end
