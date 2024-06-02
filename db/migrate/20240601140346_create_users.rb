class CreateUsers < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :password_hash

      t.string :first_name
      t.string :last_name
      t.text :avatar_url

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
