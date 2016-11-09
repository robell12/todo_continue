class CreateNames < ActiveRecord::Migration[5.0]
  def change
    create_table :names do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :about

      t.timestamps
    end
  end
end
