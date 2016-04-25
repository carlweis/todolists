class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.datetime :confirmed_at
      t.string :remember_token, limit: 128, null: false
      t.boolean :admin, default: false
      t.string :role, default: 'member'
    end

    add_index :users, :username
    add_index :users, :role
    add_index :users, :email
    add_index :users, :remember_token
  end
end
