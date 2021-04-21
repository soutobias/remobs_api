class CreateSpotters < ActiveRecord::Migration[6.0]
  def change
    create_table :spotters do |t|

      t.timestamps
    end
  end
end
