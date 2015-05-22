class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :password_hash
      t.boolean :faculty

      t.timestamps
    end
  end
end
