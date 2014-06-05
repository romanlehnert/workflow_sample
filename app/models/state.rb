class State < ActiveRecord::Base
  belongs_to :workflow
  has_many :transitions, foreign_key: :origin_id
end
