class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :start_state_id
      t.integer :end_state_id
      t.string :name

      t.timestamps
    end
  end
end
