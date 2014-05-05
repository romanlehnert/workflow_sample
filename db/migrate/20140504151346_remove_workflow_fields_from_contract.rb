class RemoveWorkflowFieldsFromContract < ActiveRecord::Migration
  def change
    remove_column :contracts, :workflow_id
    remove_column :contracts, :state_id
  end
end
