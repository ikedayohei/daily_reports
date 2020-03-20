class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :postcode
      t.string :phone_number
      t.string :capital
      t.string :sale
      t.string :description
      t.text :characteristic
      t.string :url
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
