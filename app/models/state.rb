class State < ActiveRecord::Base
  belongs_to :workflow
  has_many :contracts
end
