class CreateIncomedatas < ActiveRecord::Migration[6.1]
  def change
    create_table :incomedatas do |t|
      t.date :date, null:false
      t.string :content
      t.integer :amount, null:false, numericality: { only_integer: true}
      t.string :litem, null:false
      t.string :mitem
      t.timestamps
    end
  end
end
