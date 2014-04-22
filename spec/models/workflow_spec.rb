require 'spec_helper'

describe Workflow do
  describe "associations" do
    it { should have_many(:states) }
  end
end
