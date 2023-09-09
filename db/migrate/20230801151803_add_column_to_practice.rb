class AddColumnToPractice < ActiveRecord::Migration[6.1]
  def change
    add_column :practices, :position, :integer
  end
end
