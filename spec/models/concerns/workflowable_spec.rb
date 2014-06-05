require 'spec_helper'

shared_examples "workflowable" do
  describe "associtations" do
    it { should have_one(:workflow_membership) }
    it { should have_one(:workflow).through(:workflow_membership) }
    it { should have_one(:state).through(:workflow_membership) }
  end

  describe "validations" do
  #  it { should validate_presence_of(:state) }
  end

  describe "#default_workflow" do
    let!(:workflow) { Workflow.create }

    it "should respond to #default_workflow" do
      expect(described_class.new).to respond_to(:default_workflow)
    end

    it "returns the first available workflow" do
      expect(described_class.new.default_workflow).to eql(workflow)
    end
  end

  describe "#initialize_workflow" do
    let!(:workflow_1) { Workflow.create }
    let!(:workflow_2) { Workflow.create }
    let!(:subject) { described_class.new }

    context "given a workflow" do
      it "assigns the given workflow" do
        subject.initialize_workflow(workflow_2)
        expect(subject.workflow).to eql(workflow_2)
      end
    end

    context "not given any workflow" do
      it "assigns the default_workflow" do
        allow(subject).to receive(:default_workflow).and_return(workflow_1)
        expect(subject).to receive(:default_workflow).exactly(1).times
        subject.initialize_workflow
        expect(subject.workflow).to eql(workflow_1)
      end
    end
  end

  describe "#initialize_state" do
    let(:subject) { described_class.new }
    it "responds to #initialize_state" do
      expect(subject).to respond_to(:initialize_state)
    end

    context "when subject does not have a workflow" do
      it "raises a NoWorkFlow exception" do
        expect{subject.initialize_state}.to raise_error("NoWorkflow")
      end
    end

    context "when subject has a workflow" do
      let!(:workflow) { Workflow.create }
      let!(:states) { { initialized: workflow.states.create(name: :initialized, initial: true),
                       in_progress: workflow.states.create(name: :in_progress),
                       done:        workflow.states.create(name: :done)} }
      before do
        subject.initialize_workflow(workflow)
      end

      it "assignes the state to the workflow's initial_state" do
        subject.initialize_state
        expect(subject.state).to eql(states[:initialized])
      end
    end
  end


  describe "#possible_transitions" do
    context "when subject has a workflow" do
      let!(:workflow) { create(:default_workflow) }
      before do
        subject.initialize_workflow(workflow)
        subject.initialize_state
      end

      it "raises a 'NoStateError', when the subject has no state" do
        subject.state = nil
        expect{subject.possible_transitions}.to raise_error("NoStateError")
      end

      it "returns zero possible transitions" do
        workflow.states.each do |state|
          state.transitions.destroy_all
        end
        expect(subject.possible_transitions.count).to eql(0)
      end

      it "returns the possible transitions" do
        expect(subject.possible_transitions.count).to eql(1)
        expect(subject.possible_transitions.first).to eql(workflow.initial_state.transitions.first)
      end
    end
  end

  describe "#execute_transition" do

    it { should respond_to(:execute_transition) }

    context "when the transitions is possible" do
      it "calls #check_transition_conditions" do
        #expect(subject).to receive(:check_transition_conditions)
        #subject.execute_transition
        pending
      end
      it "calls #execute_transition" do
        pending
      end
      it "calls #execute_post_hooks" do
        pending
      end
    end
    context "when the transition is not possible" do
      before do
        subject.stub(:transitions_possible?).and_return(false)
      end
      it "raises a 'TransitionNotPossible' Error" do
        expect{subject.execute_transition}.to raise_error("TransitionNotPossible")
      end
    end
  end



  describe "#transition_possibe?(transition)" do
    it "returns true if the transition is included in #possible_transitions" do
      pending
    end

    it "returns false if the transition is not included in  #possible_transitions" do
      pending
    end
  end





end
