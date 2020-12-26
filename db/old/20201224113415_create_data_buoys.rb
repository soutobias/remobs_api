class CreateDataBuoys < ActiveRecord::Migration[6.0]
  def change
    create_table :data_buoys do |t|

      t.timestamps
    end
  end
end
