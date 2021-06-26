class CreateBmoRaws < ActiveRecord::Migration[6.0]
  def change
    create_table :bmo_raws do |t|

      t.timestamps
    end
  end
end
