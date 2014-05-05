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

end
