class Workflow < ActiveRecord::Base
  has_many :states

  def has_initial_state?
    states.where(initial: true).any?
  end

  def initial_state
    raise "NoInitialState" if !has_initial_state?
    states.where(initial: true).first
  end
end
