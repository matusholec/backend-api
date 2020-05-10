class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :start_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :staff_required
      t.string :job_type
      #string because of sqlite
      t.string :uuid, null: false

      t.timestamps
    end
  end
end
