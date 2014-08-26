class CreateUsers < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name, :null => false, :limit => 50
      t.timestamps
    end

    create_table :users do |t|
      t.string      :email,           :null => false, :limit => 50
      t.belongs_to  :subscription,    :null => false
      t.string      :password_digest, :null => false,  :limit => 255
      t.string      :forename,        :null => false, :limit => 100
      t.string      :surname,         :null => false, :limit => 100
      t.string      :auth_token
      t.string      :password_reset_token
      t.datetime    :password_reset_sent_at

      t.timestamps
    end
  end
end
