class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.timestamps
      t.string :title
      t.string :body
      t.string :name
      t.string :introduction
      t.syring :image
    end
  end
end
