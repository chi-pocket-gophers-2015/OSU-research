class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User"
end
