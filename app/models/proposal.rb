class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User"
  has_many :experiments

	validates :title, :hypothesis, :status, :summary, presence: true  
end
