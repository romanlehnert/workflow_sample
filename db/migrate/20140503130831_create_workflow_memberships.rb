class CreateWorkflowMemberships < ActiveRecord::Migration
  def change
    create_table :workflow_memberships do |t|
      t.integer :workflow_id
      t.integer :state_id
      t.string :workflow_membershippable_type
      t.integer :workflow_membershippable_id

      t.timestamps
    end
  end
end
