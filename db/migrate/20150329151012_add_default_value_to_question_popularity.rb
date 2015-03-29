class AddDefaultValueToQuestionPopularity < ActiveRecord::Migration
  def change
    remove_column :questions, :popularity
    add_column :questions, :popularity, :integer, :default => 0
  end
end