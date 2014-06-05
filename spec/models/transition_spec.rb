require 'spec_helper'

describe Transition do
  describe "associations" do
    it { should belong_to(:origin).class_name("State") }
    it { should belong_to(:target).class_name("State") }

    it { should have_many(:hooks) }
  end
end
