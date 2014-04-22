class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :state, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
