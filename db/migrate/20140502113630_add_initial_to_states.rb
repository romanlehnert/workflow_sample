class AddInitialToStates < ActiveRecord::Migration
  def change
    add_column :states, :initial, :boolean
  end
end
