class RecipesUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :recipes_users, id: false do |t|
      t.integer :user_id
      t.integer :recipe_id
    end

    add_index :recipes_users, :user_id
    add_index :recipes_users, :recipe_id
    add_index :recipes_users, [:user_id, :recipe_id], unique: true
  end
end
