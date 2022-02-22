class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.decimal :price
      t.string :name
      t.string :species
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
