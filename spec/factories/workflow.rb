FactoryGirl.define do
  factory :workflow do
    name "workflow"
  end

  factory :state do
    name "state"
  end

  factory :transition do
    name "transition"
  end

  factory :default_workflow, parent: :workflow do

    after(:create) do |workflow|
      state_1 = create(:state, workflow: workflow, name: "open", initial: true)
      state_2 = create(:state, workflow: workflow, name: "in progress")
      state_3 = create(:state, workflow: workflow, name: "done")

      transition_1 = create(:transition, origin: state_1, target: state_2, name: "start")
      transition_2 = create(:transition, origin: state_2, target: state_3, name: "finish")
      transition_3 = create(:transition, origin: state_2, target: state_1, name: "put_back")
      transition_4 = create(:transition, origin: state_3, target: state_1, name: "reject")

    end
  end
end
