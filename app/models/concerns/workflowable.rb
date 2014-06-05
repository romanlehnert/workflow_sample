module Workflowable

  extend ActiveSupport::Concern

  included do
    has_one :workflow_membership, as: :workflow_membershippable

    has_one :workflow, through: :workflow_membership
    has_one :state, through: :workflow_membership

    validates :state, presence: true
    validates :workflow, presence: true
  end


  def default_workflow
    Workflow.first
  end

  def initialize_workflow(given_workflow = nil)
    self.workflow = given_workflow || default_workflow
  end

  def initialize_state
    raise "NoWorkflow" if !workflow
    self.state = workflow.initial_state
  end

  def possible_transitions
    raise "NoStateError" if !state
    state.transitions
  end

  def execute_transition

  end

  module ClassMethods 
    def pickup!
    end

    def finish!
    end
  end
end
