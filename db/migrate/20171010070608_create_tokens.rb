class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.text :access_token
      t.text :realm_id
      t.text :refresh_token
      t.datetime :expires_in
      t.datetime :x_refresh_token_expires_in

      t.timestamps
    end
  end
end
