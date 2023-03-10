class CreatePaints < ActiveRecord::Migration[7.0]
  def change
    create_table :paints do |t|
      t.string :name
      t.string :brand
      t.string :color

      t.timestamps
    end
  end
end
