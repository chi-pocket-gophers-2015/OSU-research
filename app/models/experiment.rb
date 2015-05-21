class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :staffer, class_name: "User", foreign_key: :staffer_id
end
