class CreateUserProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_products do |t|
      t.references  :user
      t.references  :product
      t.timestamps
    end
  end
end
