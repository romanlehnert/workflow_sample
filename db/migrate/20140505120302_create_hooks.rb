class CreateHooks < ActiveRecord::Migration
  def change
    create_table :hooks do |t|
      t.string :occurance
      t.string :service
      t.string :params
      t.integer :transition_id

      t.timestamps
    end
  end
end
