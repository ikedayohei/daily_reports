class AddCompanyToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :company, :string
  end
end
