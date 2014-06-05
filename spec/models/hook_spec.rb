require 'spec_helper'

describe Hook do
  describe "associations" do
    it { should belong_to(:transition) }
  end
end
