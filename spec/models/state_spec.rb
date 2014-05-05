require 'spec_helper'

describe State do
  describe "associations" do
    it { should belong_to(:workflow) }
  end

  describe "attributes" do
    describe "#initial" do
      it "should be false by default" do
        expect(State.new.initial).to be_false
      end
    end
  end
end
