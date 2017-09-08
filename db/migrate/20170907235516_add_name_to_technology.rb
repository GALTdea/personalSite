class AddNameToTechnology < ActiveRecord::Migration[5.0]
  def change
    add_column :technologies, :name, :string
  end
end
