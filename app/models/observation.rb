class Observation < ActiveRecord::Base
  belongs_to :experiment
  has_one :staffer, through: :experiment
end
