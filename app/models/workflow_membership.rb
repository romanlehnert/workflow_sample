class WorkflowMembership < ActiveRecord::Base
  belongs_to :workflow_membershippable, polymorphic: true
  belongs_to :workflow
  belongs_to :state
end
