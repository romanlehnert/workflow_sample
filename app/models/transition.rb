class Transition < ActiveRecord::Base
  belongs_to :start_state, class_name: "State", foreign_key: :start_state_id
  belongs_to :end_state, class_name: "State", foreign_key: :end_state_id
end
