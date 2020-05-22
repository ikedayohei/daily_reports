class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :text,null: false
      t.string :where,null: false
      t.string :reponder,null: false
      t.string :companion
      t.date :date,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
