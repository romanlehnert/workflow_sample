class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :origin_id
      t.integer :target_id
      t.string :name

      t.timestamps
    end
  end
end
