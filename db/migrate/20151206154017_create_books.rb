class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.string :illustator, default: "No Illustrator"
      t.timestamps null: false
    end
  end
end
