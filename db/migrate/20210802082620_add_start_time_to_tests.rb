class AddStartTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :start_time, :datetime
  end
end
