class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :company, null: false
      t.string :phone, null: false
      t.string :address, null: false
      
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
