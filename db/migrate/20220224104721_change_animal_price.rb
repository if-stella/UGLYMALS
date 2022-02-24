class ChangeAnimalPrice < ActiveRecord::Migration[6.1]
  def change
    change_column :animals, :price, :integer
  end
end
