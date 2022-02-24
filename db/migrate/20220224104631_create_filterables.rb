class CreateFilterables < ActiveRecord::Migration[6.1]
  def change
    create_table :filterables do |t|

      t.timestamps
    end
  end
end
