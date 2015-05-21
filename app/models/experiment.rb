class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :staffer, class_name: "User", foreign_key: :staffer_id
  has_many :observations

  validates :title, :procedure, :results, :conclusion, presence: true

  def close
    self.active = false
  end
end
