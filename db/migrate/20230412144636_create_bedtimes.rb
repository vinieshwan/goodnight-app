class CreateBedtimes < ActiveRecord::Migration[7.0]
  def change
    create_table :bedtimes do |t|
      t.integer :user_id, null: false, index: true
      t.datetime :clock_in, null: false
      t.datetime :clock_out
      t.integer :duration, index: true

      t.timestamps
    end
  end
end
