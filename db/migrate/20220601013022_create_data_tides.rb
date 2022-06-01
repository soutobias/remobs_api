class CreateDataTides < ActiveRecord::Migration[6.0]
  def change
    create_table :data_tides do |t|

      t.timestamps
    end
  end
end
