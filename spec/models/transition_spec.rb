require 'spec_helper'

describe Transition do
  describe "associations" do
    it { should belong_to(:start_state).class_name("State").with_foreign_key(:start_state_id) }
    it { should belong_to(:end_state).class_name("State").with_foreign_key(:end_state_id) }
  end
end
