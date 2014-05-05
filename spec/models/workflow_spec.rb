require 'spec_helper'

describe Workflow do
  describe "associations" do
    it { should have_many(:states) }
  end

  describe "#has_initial_state?" do

    let(:workflow) { Workflow.create! }

    it "should respond to #has_initial_state?" do
      expect(workflow).to respond_to(:has_initial_state?)
    end

    context "with a present initialstate" do
      let!(:initial_state) { workflow.states.create!(name: :initial, initial: true) }

      it "returns true" do
        expect(workflow.has_initial_state?).to be_true
      end
    end

    context "without a present initial state" do
      it "returns true" do
        expect(workflow.has_initial_state?).to be_false
      end
    end
  end

  describe "#initial_state" do
    let(:workflow) { Workflow.create! }

    it "should respond to #initial_state" do
      expect(workflow).to respond_to(:initial_state)
    end

    context "without a present initial state" do
      it "throws an error" do
        expect{workflow.initial_state}.to raise_error "NoInitialState"
      end
    end

    context "with a present initial state" do
      let!(:initial_state) { workflow.states.create!(name: :initial, initial: true) }
      it "returns the initial state" do
        expect(workflow.initial_state).to eql(initial_state)
      end
    end
  end
end
