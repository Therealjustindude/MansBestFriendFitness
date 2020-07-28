class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :gender
      t.integer :weight
      t.boolean :fixed
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end
  end
end
