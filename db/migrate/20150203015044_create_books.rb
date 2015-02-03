class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :isbn
      t.string :description
      t.binary :cover
      t.string :purchase_url

      t.timestamps null: false
    end
  end
end
