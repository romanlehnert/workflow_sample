class Transition < ActiveRecord::Base
  belongs_to :origin, class_name: "State"
  belongs_to :target, class_name: "State"

  has_many :hooks
end
