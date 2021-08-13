class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :status_complete

      t.timestamps
    end
  end
end
