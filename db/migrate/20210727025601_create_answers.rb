class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :score,    null:false
      t.text :word_answer
      t.references :test, null: false, foreign_key: true
      t.timestamps
    end
  end
end
