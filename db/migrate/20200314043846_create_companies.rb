class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :postcode
      t.integer :phone_number
      t.integer :capital
      t.integer :sale
      t.string :description
      t.text :characteristic
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
