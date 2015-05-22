class Observation < ActiveRecord::Base
  belongs_to :experiment
  validates :body, presence: true
  has_one :staffer, through: :experiment
end
