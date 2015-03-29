class AddPopularityToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :popularity, :integer
    remove_column :users, :popularity
  end
end

