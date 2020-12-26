class CreateNamesDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :names_dictionaries do |t|

      t.timestamps
    end
  end
end
