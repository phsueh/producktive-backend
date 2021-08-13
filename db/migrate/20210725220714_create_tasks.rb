class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.string :priority
      t.string :difficulty
      t.date :start_date
      t.date :end_date
      t.boolean :status_complete
      t.integer :duration
      t.references :taskable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
