class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :author, null: false, foregin_key: { to_table: 'authors' }, index:true
      t.references :created_by, null: false, foreign_key: { to_table: 'users' }, index:true

      t.timestamps
    end
  end
end
