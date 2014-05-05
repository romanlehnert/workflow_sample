class AddWorkflowToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :workflow_id, :integer
  end
end
