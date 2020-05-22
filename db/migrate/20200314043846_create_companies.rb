class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name,null: false
      t.text :postcode,null: false
      t.string :phone_number,null: false
      t.string :capital,null: false
      t.string :sale,null: false
      t.string :description,null: false
      t.text :characteristic
      t.string :url
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
