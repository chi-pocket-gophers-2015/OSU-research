class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User"
  belongs_to :category
  has_many :experiments

	validates :title, :hypothesis, :active, :summary, presence: true

  def close
    self.active = false
  end
end
