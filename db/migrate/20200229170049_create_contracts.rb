class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.string :shift_uuid, null: false
      t.string :candidate_name, null: false
      t.string :uuid, null: false

      t.timestamps
    end
  end
end
