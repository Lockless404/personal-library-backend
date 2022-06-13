class CreateAuthor < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.references :created_by, null: false, foregin_key: { to_table: 'users' }, index: true

      t.timestamps
    end
  end
end
