class Contract < ActiveRecord::Base
  belongs_to :state
  belongs_to :user

  validates :state, presence: true
end
