require 'spec_helper'

describe State do
  describe "associations" do
    it { should belong_to(:workflow) }
    it { should have_many(:contracts) }
  end
end
