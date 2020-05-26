class CreateCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :calculations do |t|
      t.string :condition
      t.string :result
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
