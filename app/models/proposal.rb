class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User"
  belongs_to :category
  has_many :experiments
end
