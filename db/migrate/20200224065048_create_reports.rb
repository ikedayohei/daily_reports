class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :text
      t.string :where
      t.string :reponder
      t.string :companion
      t.date :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
