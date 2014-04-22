require 'spec_helper'

describe Contract do

  describe "associations" do
    it { should belong_to(:state) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:state) }
  end

end
