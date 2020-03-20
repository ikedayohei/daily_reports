class AddNumcountToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :likes_count, :integer
  end
end
