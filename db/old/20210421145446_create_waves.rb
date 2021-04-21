class CreateWaves < ActiveRecord::Migration[6.0]
  def change
    create_table :waves do |t|

      t.timestamps
    end
  end
end
