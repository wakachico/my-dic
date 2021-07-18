class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.boolean :important, null:false, default: false
      t.string :name,       null:false
      t.integer :pos_id,    null:false
      t.text :meaning,      null:false
      t.integer :genre_id,  null:false
      t.text :text
      t.boolean :publish,   null:false, default: false
      t.references :user,   foreign_key: true
      t.timestamps
    end
  end
end
