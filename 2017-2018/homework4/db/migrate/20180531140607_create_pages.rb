class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.text :information
      t.integer :user_id

      t.timestamps
    end
  end
end
