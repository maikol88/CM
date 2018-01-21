class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
