class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|

      t.timestamps
    end
  end
end
