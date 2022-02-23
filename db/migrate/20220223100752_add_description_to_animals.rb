class AddDescriptionToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :description, :text
  end
end
