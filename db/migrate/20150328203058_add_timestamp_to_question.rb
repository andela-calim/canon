class AddTimestampToQuestion < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.timestamps
    end
  end
end
