class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
      t.index [:user_id, :report_id], unique: true
    end
  end
end
