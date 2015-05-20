class Proposal < ActiveRecord::Base
  belongs to :faculty, class_name: "User"
end
