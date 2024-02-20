class CreateAttractions < ActiveRecord::Migration[7.1]
  def change
    create_table :attractions do |t|
      t.string :title
      t.text :description
      t.text :location

      t.timestamps
    end
  end
end
