class CreatePracticesBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :practices_books do |t|
      t.references :practice, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
