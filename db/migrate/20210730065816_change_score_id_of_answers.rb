class ChangeScoreIdOfAnswers < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :answers, :score_id, :integer, default: '0'
    end
    
    def down
      change_column :answers, :score_id, :integer
    end
  end
end
