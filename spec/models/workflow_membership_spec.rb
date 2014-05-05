require 'spec_helper'

describe WorkflowMembership do
  describe "associations" do
    it { should belong_to :workflow }
    it { should belong_to :state }
    it { should belong_to :workflow_membershippable }
  end
end
